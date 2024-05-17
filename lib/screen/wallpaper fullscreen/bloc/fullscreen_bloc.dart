import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
part 'fullscreen_event.dart';
part 'fullscreen_state.dart';

class FullscreenBloc extends Bloc<FullscreenEvent, FullscreenState> {
  String filePath = "";

  FullscreenBloc() : super(FullscreenInitial()) {
    on<FullscreenEvent>((event, emit) {});

    on<DownloadButtonClickedEvnt>((event, emit) async {
      emit(FullScreenDownloadingState());
      await FileDownloader.downloadFile(
        url: event.imgUrl.trim(),
        onDownloadCompleted: (String path) {
          print('FILE DOWNLOADED TO PATH: $path');
          filePath = path;
          emit(FullScreenDownloadedActionState());
        },
        onDownloadError: (String error) {
          print('☕☕☕☕☕DOWNLOAD ERROR: $error');
        },
      );
    });

    on<FulScreenSetWallPaperEvent>((event, emit) async {
      emit(FullScreenWallPaperSetingState());
      var file = await DefaultCacheManager().getSingleFile(event.imgUrl);
      try {
        await WallpaperManagerFlutter().setwallpaperfromFile(file, event.wallpaperLoacation);
      } catch (e) {
        print(e);
      }
      await Future.delayed(const Duration(milliseconds: 500));
      emit(FullScreenWallPaperSetedState());
    });
    // above
  }
}
