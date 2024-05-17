part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

abstract class SearchActionState extends SearchState {}

class SearchInitial extends SearchState {}

class SearchingState extends SearchState {}

// ignore: must_be_immutable
class SearchedDataFetchedState extends SearchState {
  List<String> wallpapers = [];
  List<String> wallpapersOrignal = [];
  SearchedDataFetchedState({
    required this.wallpapers,
    required this.wallpapersOrignal,
  });
}

class NoSearchWallPaperFoundState extends SearchState {}

class SearchLoadMoreNoWallpaperState extends SearchActionState {}
