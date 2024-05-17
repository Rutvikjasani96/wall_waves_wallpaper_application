import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wall_waves_wallpaper_application/screen/favorite%20page/bloc/favorite_bloc.dart';
import '../wallpaper fullscreen/wall_full_screen.dart';
import 'bloc/home_screen_bloc.dart';
import 'package:animate_do/animate_do.dart';

int count = 0;

// testing

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeScreenBloc homeScreenBloc = HomeScreenBloc();

  @override
  Widget build(BuildContext context) {
    if (count == 0) {
      homeScreenBloc.add(HomeInitialEvent());
      homeScreenBloc.add(HomeFetchWallPapersEvent());
    } else {
      homeScreenBloc.add(HomeScreenJustBuildGridViewEvent());
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wallpapers',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          homeScreenBloc.add(HomeRefresheClickedEvent());
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10), // Adjust the bottom padding
          child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
            bloc: homeScreenBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is HomeFetchedWallPaperState) {
                return FadeIn(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 13,
                      crossAxisSpacing: 13,
                      mainAxisExtent: 250,
                    ),
                    itemCount: state.wallpapers.length + 1,
                    itemBuilder: (context, index) {
                      if (index == state.wallpapers.length) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: MaterialButton(
                            onPressed: () {
                              homeScreenBloc.add(HomeLoadMoreButtonClickedEvent());
                            },
                            color: Colors.white54,
                            child: const Text(
                              "load more",
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                        );
                      } else {
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
                                      builder: (context) => WallFullScreen(imageUrl: state.wallpapersOrignal[index]),
                                    ),
                                  );
                                },
                                child: CachedNetworkImage(
                                  imageUrl: state.wallpapers[index],
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
                              child: ClipOval(
                                child: Material(
                                  color: Colors.white54,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    onTap: () {
                                      homeScreenBloc.add(HomeLikedButtonClickedEvent(
                                        index: index,
                                        imgUrl: state.wallpapers[index],
                                        imgUrlOrignal: state.wallpapersOrignal[index],
                                      ));
                                    },
                                    child: favoriteGlobal.contains(state.wallpapers[index])
                                        ? SizedBox(
                                            height: 32,
                                            width: 32,
                                            child: Icon(
                                              Icons.favorite,
                                              size: 25,
                                              color: Colors.red.shade400,
                                            ),
                                          )
                                        : const SizedBox(
                                            height: 32,
                                            width: 32,
                                            child: Icon(
                                              Icons.favorite_border,
                                              size: 25,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                );
              } else if (state is HomeJustBuildGridViewState) {
                return FadeIn(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 13,
                      crossAxisSpacing: 13,
                      mainAxisExtent: 250,
                    ),
                    itemCount: state.wallpapers.length + 1,
                    itemBuilder: (context, index) {
                      if (index == state.wallpapers.length) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: MaterialButton(
                            onPressed: () {
                              homeScreenBloc.add(HomeLoadMoreButtonClickedEvent());
                            },
                            color: Colors.purple,
                            child: const Text(
                              "load more",
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                        );
                      }
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
                                    builder: (context) => WallFullScreen(imageUrl: state.wallpapersOrignal[index]),
                                  ),
                                );
                              },
                              child: CachedNetworkImage(
                                imageUrl: state.wallpapers[index],
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
                            child: ClipOval(
                              child: Material(
                                color: Colors.white54,
                                child: InkWell(
                                  splashColor: Colors.grey,
                                  onTap: () {
                                    homeScreenBloc.add(HomeLikedButtonClickedEvent(
                                      index: index,
                                      imgUrl: state.wallpapers[index],
                                      imgUrlOrignal: state.wallpapersOrignal[index],
                                    ));
                                  },
                                  child: favoriteGlobal.contains(state.wallpapers[index])
                                      ? SizedBox(
                                          height: 32,
                                          width: 32,
                                          child: Icon(
                                            Icons.favorite,
                                            size: 25,
                                            color: Colors.red.shade400,
                                          ),
                                        )
                                      : const SizedBox(
                                          height: 32,
                                          width: 32,
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 25,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else if (state is HomeFetchingWallPaperState) {
                return Center(
                  child: Lottie.asset(
                    "assets/images/multi-shape-loader.json",
                    height: 70,
                    width: 100,
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
