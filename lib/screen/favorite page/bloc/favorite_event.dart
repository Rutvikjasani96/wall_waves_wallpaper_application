part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class FavoriteInitialEvent extends FavoriteEvent{}

// ignore: must_be_immutable
class FavoriteButtonCLickedEvent extends FavoriteEvent {
  String imgUrl;
  String imgUrlOrignal;
  FavoriteButtonCLickedEvent({
    required this.imgUrl,
    required this.imgUrlOrignal,
  });
}
