part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class HomeInitialEvent extends HomeScreenEvent {}

class HomeFetchWallPapersEvent extends HomeScreenEvent {}

class HomeRefresheClickedEvent extends HomeScreenEvent {}

class HomeScreenJustBuildGridViewEvent extends HomeScreenEvent {}

class HomeLoadMoreButtonClickedEvent extends HomeScreenEvent{}

// ignore: must_be_immutable
class HomeLikedButtonClickedEvent extends HomeScreenEvent {
  final int index;
  final String imgUrl;
  final String imgUrlOrignal;

  HomeLikedButtonClickedEvent({
    required this.index,
    required this.imgUrl,
    required this.imgUrlOrignal,
  });
}
