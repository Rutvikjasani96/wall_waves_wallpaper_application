import 'package:flutter/material.dart';
import 'package:wall_waves_wallpaper_application/screen/favorite%20page/bloc/favorite_bloc.dart';
import '../../export/export.dart';
import '../wallpaper fullscreen/wall_full_screen.dart';

// ignore: must_be_immutable
class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  FavoriteBloc favoriteBloc = FavoriteBloc();

  @override
  Widget build(BuildContext context) {
    favoriteBloc.add(FavoriteInitialEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Favorite",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: BlocConsumer<FavoriteBloc, FavoriteState>(
          bloc: favoriteBloc,
          listenWhen: (previous, current) => current is FavoriteActionState,
          listener: (context, state) async {
            if (state is FavoriteRemovedActionState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("wallpaper removed from favorie list "),
                  duration: Duration(microseconds: 500),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is FavoriteRemovedState || state is FavoriteInitialState) {
              if (favoriteGlobal.isNotEmpty) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 13,
                    crossAxisSpacing: 13,
                    mainAxisExtent: 250,
                  ),
                  itemCount: favoriteGlobal.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      fit: StackFit.passthrough,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => WallFullScreen(imageUrl: favoriteGlobalOrignal[index]),
                                ),
                              );
                            },
                            child: CachedNetworkImage(
                              imageUrl: favoriteGlobal[index],
                              fit: BoxFit.cover,
                              placeholder: (context, url) => SizedBox(
                                child: Lottie.asset(
                                  "assets/images/99318-hms-loading.json",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(color: Colors.white54, shape: BoxShape.circle),
                            child: GestureDetector(
                              onTap: () {
                                favoriteBloc.add(FavoriteButtonCLickedEvent(
                                  imgUrl: favoriteGlobal[index],
                                  imgUrlOrignal: favoriteGlobalOrignal[index],
                                ));
                              },
                              child: const Icon(
                                Icons.favorite,
                                size: 25,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        "assets/images/Comp 1.json",
                        height: 300,
                        width: 300,
                      ),
                      const Text(
                        "You Have No Favorite WallPapers",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
