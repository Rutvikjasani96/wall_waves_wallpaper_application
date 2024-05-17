import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
import '../../export/export.dart';
import 'bloc/fullscreen_bloc.dart';

// ignore: must_be_immutable
class WallFullScreen extends StatelessWidget {
  final String imageUrl;
  WallFullScreen({Key? key, required this.imageUrl}) : super(key: key);

  FullscreenBloc fullScreenBloc = FullscreenBloc();

// apple theme
  void _showApplyOptionsApple(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Apply Wallpaper'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              onPressed: () {
                // Apply in Lock Screen
                _applyWallpaper();
                Navigator.pop(context);
              },
              child: const Text('Apply in Lock Screen'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                // Apply in Home Screen
                _applyWallpaper();
                Navigator.pop(context);
              },
              child: const Text('Apply in Home Screen'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                // Apply in Both Screens
                _applyWallpaper();
                Navigator.pop(context);
              },
              child: const Text('Apply in Both Screens'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            isDefaultAction: true,
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }

// android theme
  void _showApplyOptionsAndroid(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text(' Lock Screen'),
                onTap: () {
                  // Apply in Lock Screen
                  // _applyWallpaper(WallpaperScreen.LockScreen);
                  fullScreenBloc.add(FulScreenSetWallPaperEvent(
                      imgUrl: imageUrl, wallpaperLoacation: WallpaperManagerFlutter.LOCK_SCREEN));

                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(' Home Screen'),
                onTap: () {
                  // Apply in Home Screen
                  // _applyWallpaper(WallpaperScreen.HomeScreen);
                  fullScreenBloc.add(FulScreenSetWallPaperEvent(
                      imgUrl: imageUrl, wallpaperLoacation: WallpaperManagerFlutter.HOME_SCREEN));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.mobile_screen_share),
                title: const Text(' Both Screens'),
                onTap: () {
                  // Apply in Both Screens
                  // _applyWallpaper(WallpaperScreen.BothScreens);
                  fullScreenBloc.add(FulScreenSetWallPaperEvent(
                      imgUrl: imageUrl, wallpaperLoacation: WallpaperManagerFlutter.BOTH_SCREENS));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _applyWallpaper() {
    switch (1) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FullscreenBloc, FullscreenState>(
        bloc: fullScreenBloc,
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Center(
                    child: Text('Error loading image'),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipOval(
                          child: Material(
                            color: Colors.white.withOpacity(0.7), // Button color
                            child: InkWell(
                              splashColor: Colors.black.withOpacity(0.5), // Splash color
                              onTap: () async {
                                fullScreenBloc.add(DownloadButtonClickedEvnt(imgUrl: imageUrl));
                              },
                              child: const SizedBox(
                                height: 45,
                                width: 45,
                                child: Center(child: Icon(Icons.download)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: CupertinoButton(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white.withOpacity(0.7),
                            pressedOpacity: 0.5,
                            onPressed: state is FullScreenWallPaperSetingState
                                ? null
                                : () {
                                    // await _setwallpaper(WallpaperManagerFlutter.HOME_SCREEN);
                                    // fullScreenBloc.add(FulScreenSetWallPaperEvent(imgUrl: imageUrl));
                                    _showApplyOptionsAndroid(context);
                                  },
                            child: const Text(
                              "Apply now",
                              style: TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                        ClipOval(
                          child: Material(
                            color: Colors.white.withOpacity(0.7), // Button color
                            child: InkWell(
                              splashColor: Colors.black.withOpacity(0.5), // Splash color
                              onTap: () {
                                Share.share(imageUrl);
                              },
                              child: const SizedBox(
                                height: 43,
                                width: 43,
                                child: Center(
                                  child: Icon(
                                    Icons.share,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 25,
                left: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 27,
                    color: Colors.black,
                  ),
                ),
              ),
              // Positioned(
              //   top: 16,
              //   right: 5,
              //   child: IconButton(
              //     onPressed: () {
              //       // Share.share(widget.imageUrl);
              //     },
              //     icon: IconButton(
              //       onPressed: () {},
              //       icon: const Icon(
              //         Icons.ios_share_rounded,
              //         size: 27,
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // ),
              BlocConsumer<FullscreenBloc, FullscreenState>(
                  listenWhen: (previous, current) => current is FullscreenActionState,
                  listener: (context, state) {
                    if (state is FullScreenDownloadedActionState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          duration: Duration(milliseconds: 500),
                          content: Text(
                            "photo downloaded to your gallery",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    } else if (state is FullScreenWallPaperSetedState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green.shade400,
                          duration: const Duration(milliseconds: 500),
                          content: const Text('Wallpaper updated'),
                        ),
                      );
                    } else if (state is FullScreenWallPaperSetingErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red.shade400,
                          duration: const Duration(milliseconds: 500),
                          content: const Text('Wallpaper updated'),
                        ),
                      );
                    }
                  },
                  bloc: fullScreenBloc,
                  builder: (context, state) {
                    if (state is FullScreenDownloadingState) {
                      return Center(
                        child: LottieBuilder.asset(
                          "assets/images/98432-loading.json",
                          height: 70,
                          width: 70,
                        ),
                      );
                    } else if (state is FullScreenWallPaperSetingState) {
                      return Center(
                        child: LottieBuilder.asset(
                          "assets/images/98432-loading.json",
                          height: 70,
                          width: 70,
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  })
            ],
          );
        },
      ),
    );
  }
}
