part of 'fullscreen_bloc.dart';

@immutable
abstract class FullscreenState {}

abstract class FullscreenActionState extends FullscreenState {}

class FullscreenInitial extends FullscreenState {}

class FullScreenWallPaperSetingState extends FullscreenState {}

class FullScreenWallPaperSetedState extends FullscreenActionState {}

class FullScreenWallPaperSetingErrorState extends FullscreenActionState {}

class FullScreenWallPaperSetedActionState extends FullscreenActionState {}

class FullScreenDownloadingState extends FullscreenState {}

class FullScreenDownloadedActionState extends FullscreenActionState {}
