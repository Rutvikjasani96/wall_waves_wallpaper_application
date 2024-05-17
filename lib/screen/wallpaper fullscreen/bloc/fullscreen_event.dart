part of 'fullscreen_bloc.dart';

@immutable
abstract class FullscreenEvent {}

// ignore: must_be_immutable
class FulScreenSetWallPaperEvent extends FullscreenEvent {
  String imgUrl;
  int wallpaperLoacation;
  FulScreenSetWallPaperEvent({
    required this.imgUrl,
    required this.wallpaperLoacation,
  });
}

// ignore: must_be_immutable
class DownloadButtonClickedEvnt extends FullscreenEvent {
  String imgUrl;
  DownloadButtonClickedEvnt({
    required this.imgUrl,
  });
}
