part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {}

abstract class HomeScreenActionState extends HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

// ignore: must_be_immutable
class HomeDarkModeOptionClickState extends HomeScreenState {
  bool isDarkMode;
  HomeDarkModeOptionClickState({
    required this.isDarkMode,
  });
}

class HomeFetchingWallPaperState extends HomeScreenState {}

// ignore: must_be_immutable
class HomeJustBuildGridViewState extends HomeScreenState {
  List<String> wallpapers = [];
  List<String> wallpapersOrignal = [];
  HomeJustBuildGridViewState({
    required this.wallpapers,
    required this.wallpapersOrignal,
  });
}

// ignore: must_be_immutable
class HomeLikedButtonClickedState extends HomeScreenState {
  List<bool> liked = [];
  HomeLikedButtonClickedState({
    required this.liked,
  });
}

// ignore: must_be_immutable
class HomeFetchedWallPaperState extends HomeScreenState {
  List<String> wallpapers = [];
  List<String> wallpapersOrignal = [];

  HomeFetchedWallPaperState({
    required this.wallpapers,
    required this.wallpapersOrignal,
  });
}
