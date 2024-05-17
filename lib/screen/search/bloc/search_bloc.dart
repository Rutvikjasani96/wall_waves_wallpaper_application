import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../api/api_key.dart';
import '../../favorite page/bloc/favorite_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

String query = "";

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  List<String> wallpapers = [];
  List<String> wallpapersOrignal = [];

  final favoritesGlobalH = Hive.box('favorites');
  final favoritesGlobalOrignalH = Hive.box('favoritesGlobal');
  int page = 1;

  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {});

    on<SearchButtonClickedEvent>((event, emit) async {
      emit(SearchingState());
      query = event.query;

      final response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=${event.query}&per_page=80"),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        wallpapers = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['large']));
        wallpapersOrignal = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['original']));

        if (wallpapers.isNotEmpty) {
          emit(SearchedDataFetchedState(
            wallpapers: wallpapers,
            wallpapersOrignal: wallpapersOrignal,
          ));
          print("❤️❤️❤️❤️");
          print("i am searched");
          print(wallpapers.length);
        } else {
          emit(NoSearchWallPaperFoundState());
        }
      } else {
        print("😡😡😡");
        throw Exception('Failed to fetch wallpapers');
      }
    });

    on<SearcheRefreshCalledEvent>((event, emit) async {
      wallpapers.clear();
      wallpapersOrignal.clear();

      page++;
      emit(SearchingState());
      final response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=${query}&per_page=80&page=$page"),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        wallpapers = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['large']));
        wallpapersOrignal = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['original']));
      } else {
        throw Exception('Failed to fetch wallpapers');
      }

      if (wallpapers.isNotEmpty) {
        emit(SearchedDataFetchedState(
          wallpapers: wallpapers,
          wallpapersOrignal: wallpapersOrignal,
        ));
      } else {
        emit(NoSearchWallPaperFoundState());
      }
    });

    on<SearchFavoriteButtonClickedEvent>((event, emit) async {
      if (!favoriteGlobal.contains(event.imgUrl)) {
        favoriteGlobal.insert(0, event.imgUrl);
        favoriteGlobalOrignal.insert(0, event.imgUrlOrignal);
      } else {
        favoriteGlobal.remove(event.imgUrl);
        favoriteGlobalOrignal.remove(event.imgUrlOrignal);
      }
      emit(SearchedDataFetchedState(
        wallpapers: wallpapers,
        wallpapersOrignal: wallpapersOrignal,
      ));

      await favoritesGlobalH.put('favorites', favoriteGlobal);
      await favoritesGlobalOrignalH.put('favoritesGlobal', favoriteGlobalOrignal);
    });

    on<SearchLoadMoreButtonClickedEvent>((event, emit) async {
      page++;
      int length = wallpapers.length;
      final response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=${event.query}&per_page=80&page=$page"),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        wallpapers.addAll(List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['large'])));
        wallpapersOrignal.addAll(List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['original'])));
      } else {
        throw Exception('Failed to fetch wallpapers');
      }

      if (length == wallpapers.length) {
        emit(SearchLoadMoreNoWallpaperState());
      }

      emit(SearchedDataFetchedState(
        wallpapers: wallpapers,
        wallpapersOrignal: wallpapersOrignal,
      ));
    });

    // above
  }
}
