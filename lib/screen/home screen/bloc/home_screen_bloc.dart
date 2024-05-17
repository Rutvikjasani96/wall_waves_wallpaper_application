import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wall_waves_wallpaper_application/screen/favorite%20page/bloc/favorite_bloc.dart';
import 'package:wall_waves_wallpaper_application/screen/home%20screen/home_screen.dart';
import '../../../api/api_key.dart';
part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  List<String> wallpapers = [];
  List<String> wallpapersOrignal = [];
  bool isDarkMode = true;

  final _wallpapersHive = Hive.box('wallpapers');
  final _wallpapersOrignalHive = Hive.box('wallpapersOrignal');
  final favoritesGlobalH = Hive.box('favorites');
  final favoritesGlobalOrignalH = Hive.box('favoritesGlobal');

  int page = 1;
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenEvent>((event, emit) {});
    on<HomeFetchWallPapersEvent>((event, emit) async {
      count = 1;
      emit(HomeFetchingWallPaperState());
      final response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        wallpapers = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['large']));
        wallpapersOrignal = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['original']));

        // storing in hive
        await _wallpapersHive.put('wallpapers', wallpapers);
        await _wallpapersOrignalHive.put('wallpapersOrignal', wallpapersOrignal);

        //wallpaper's are fetched
        emit(HomeFetchedWallPaperState(
          wallpapers: wallpapers,
          wallpapersOrignal: wallpapersOrignal,
        ));
        print("🔔🔔");
        print(wallpapers);
        print("HomeFetchedWallPaperState i am emited");
      } else {
        throw Exception('Failed to fetch wallpapers');
      }
    });

    on<HomeRefresheClickedEvent>((event, emit) async {
      wallpapers.clear();
      wallpapersOrignal.clear();

      // clear first hive so new will be added
      _wallpapersHive.clear();
      _wallpapersOrignalHive.clear();
      page++;

      //now we will start the process of fetching wallpaper
      emit(HomeFetchingWallPaperState());

      // trying to fetch
      final response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=80&page=$page"),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        wallpapers = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['large']));
        wallpapersOrignal = List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['original']));

        // add the data in hive
        await _wallpapersHive.put('wallpapers', wallpapers);
        await _wallpapersOrignalHive.put('wallpapersOrignal', wallpapersOrignal);
      } else {
        throw Exception('Failed to fetch wallpapers');
      }
      emit(HomeFetchedWallPaperState(
        wallpapers: wallpapers,
        wallpapersOrignal: wallpapersOrignal,
      ));
    });

    on<HomeLikedButtonClickedEvent>((event, emit) async {
      if (!favoriteGlobal.contains(event.imgUrl)) {
        favoriteGlobal.insert(0, event.imgUrl);
        favoriteGlobalOrignal.insert(0, event.imgUrlOrignal);
      } else {
        favoriteGlobal.remove(event.imgUrl);
        favoriteGlobalOrignal.remove(event.imgUrlOrignal);
      }

      emit(HomeFetchedWallPaperState(wallpapers: wallpapers, wallpapersOrignal: wallpapersOrignal));

      await favoritesGlobalH.put('favorites', favoriteGlobal);
      await favoritesGlobalOrignalH.put('favoritesGlobal', favoriteGlobalOrignal);
      print("Hey I am just puted in home");
    });

    on<HomeScreenJustBuildGridViewEvent>((event, emit) {
      wallpapers = _wallpapersHive.get('wallpapers');
      wallpapersOrignal = _wallpapersOrignalHive.get('wallpapersOrignal');

      emit(HomeJustBuildGridViewState(wallpapers: wallpapers, wallpapersOrignal: wallpapersOrignal));
    });

    on<HomeInitialEvent>((event, emit) {
      favoriteGlobal = favoritesGlobalH.get('favorites');
      favoriteGlobalOrignal = favoritesGlobalOrignalH.get('favoritesGlobal');
    });

    on<HomeLoadMoreButtonClickedEvent>((event, emit) async {
      page++;

      // trying to fetch
      final response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=80&page=$page"),
        headers: {
          'Authorization': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        wallpapers.addAll(List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['large'])));
        wallpapersOrignal.addAll(List<String>.from(data['photos'].map((wallpaper) => wallpaper['src']['original'])));

        // add the data in hive
        // await _wallpapersHive.put('wallpapers', wallpapers);
        // await _wallpapersOrignalHive.put('wallpapersOrignal', wallpapersOrignal);
      } else {
        throw Exception('Failed to fetch wallpapers');
      }
      emit(HomeFetchedWallPaperState(
        wallpapers: wallpapers,
        wallpapersOrignal: wallpapersOrignal,
      ));
    });

    // write above
  }
}
