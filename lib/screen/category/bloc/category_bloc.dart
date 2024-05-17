import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import '../../../api/api_key.dart';
import 'package:http/http.dart' as http;

import '../../favorite page/bloc/favorite_bloc.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  List<String> wallpapers = [];
  List<String> wallpapersOrignal = [];
  List<String> wallpapersLandscape = [];
  final favoritesGlobalH = Hive.box('favorites');
  final favoritesGlobalOrignalH = Hive.box('favoritesGlobal');

  int page = 1;
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) {});

    //
    on<CategoryFetchWallPapers>((event, emit) async {
      emit(CategoryFetchingWallPaperState());
      final response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=${event.name}&per_page=80"),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        wallpapers = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['large']));
        wallpapersOrignal = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['original']));
        wallpapersLandscape = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['landscape']));

        emit(CategoryFetchedWallPaperState(
          wallpapers: wallpapers,
          wallpapersOrignal: wallpapersOrignal,
          wallpapersLandscape: wallpapersLandscape,
        ));
      } else {
        throw Exception('Failed to fetch wallpapers');
      }
    });

    on<CategoryRefreshEvent>((event, emit) async {
      wallpapers.clear();
      wallpapersOrignal.clear();
      wallpapersLandscape.clear();
      page++;
      emit(CategoryFetchingWallPaperState());
      final response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=${event.name}&per_page=80&page=$page"),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        wallpapers = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['large']));
        wallpapersOrignal = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['original']));
        wallpapersLandscape = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['landscape']));
      } else {
        throw Exception('Failed to fetch wallpapers');
      }

      emit(CategoryFetchedWallPaperState(
        wallpapers: wallpapers,
        wallpapersOrignal: wallpapersOrignal,
        wallpapersLandscape: wallpapersLandscape,
      ));

      if (wallpapers.isEmpty) {
        emit(CategoryNoWallPaper());
      }
    });

    on<CategoryLikedButtonClicked>((event, emit) async {
      if (!favoriteGlobal.contains(event.imgUrl)) {
        favoriteGlobal.insert(0, event.imgUrl);
        favoriteGlobalOrignal.insert(0, event.imgUrlOrignal);
      } else {
        favoriteGlobal.remove(event.imgUrl);
        favoriteGlobalOrignal.remove(event.imgUrlOrignal);
      }
      emit(CategoryFetchedWallPaperState(
        wallpapers: wallpapers,
        wallpapersOrignal: wallpapersOrignal,
        wallpapersLandscape: wallpapersLandscape,
      ));

      await favoritesGlobalH.put('favorites', favoriteGlobal);
      await favoritesGlobalOrignalH.put('favoritesGlobal', favoriteGlobalOrignal);
    });

    on<CategoryLoadMoreButtonClicked>((event, emit) async {
      page++;
      int length = wallpapers.length;
      final response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=${event.name}&per_page=80&page=$page"),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        wallpapers.addAll(List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['large'])));
        wallpapersOrignal.addAll(List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['original'])));
        wallpapersLandscape.addAll(List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['landscape'])));
      } else {
        throw Exception('Failed to fetch wallpapers');
      }

      if (length == wallpapers.length) {
        emit(CategoryLoadMoreNoWallpaperState());
      }

      emit(CategoryFetchedWallPaperState(
        wallpapers: wallpapers,
        wallpapersOrignal: wallpapersOrignal,
        wallpapersLandscape: wallpapersLandscape,
      ));
    });

    //above
  }
}
