part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

abstract class CategoryActionState extends CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryFetchingWallPaperState extends CategoryState {}

// ignore: must_be_immutable
class CategoryFetchedWallPaperState extends CategoryState {
  List<String> wallpapers = [];
  List<String> wallpapersOrignal = [];
  List<String> wallpapersLandscape = [];

  CategoryFetchedWallPaperState({
    required this.wallpapers,
    required this.wallpapersOrignal,
    required this.wallpapersLandscape,
  });
}

class CategoryNoWallPaper extends CategoryState {}

class CategoryLoadMoreNoWallpaperState extends CategoryActionState {}
