import 'package:flutter/material.dart';
import '../../export/export.dart';
import '../favorite page/bloc/favorite_bloc.dart';
import '../wallpaper fullscreen/wall_full_screen.dart';
import 'bloc/category_bloc.dart';

// ignore: must_be_immutable
class CategoryDetailed extends StatelessWidget {
  String categoryName;
  CategoryDetailed({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  CategoryBloc categoryBloc = CategoryBloc();

  @override
  Widget build(BuildContext context) {
    categoryBloc.add(CategoryFetchWallPapers(name: categoryName));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          categoryName,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          categoryBloc.add(CategoryRefreshEvent(name: categoryName));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 7), // Adjust the bottom padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<CategoryBloc, CategoryState>(
                bloc: categoryBloc,
                listener: (context, state) {
                  if (state is CategoryLoadMoreNoWallpaperState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        backgroundColor: Colors.red.shade400,
                        content: const Text("no more wallpaper avilable in this category"),
                      ),
                    );
                  }
                },
                listenWhen: (previous, current) => current is CategoryActionState,
                builder: (context, state) {
                  if (state is CategoryFetchedWallPaperState) {
                    return Expanded(
                      child: GridView.custom(
                        gridDelegate: SliverStairedGridDelegate(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          startCrossAxisDirectionReversed: true,
                          pattern: [
                            const StairedGridTile(1.0, 7 / 3.5),
                            const StairedGridTile(0.5, 3 / 5),
                            const StairedGridTile(0.5, 3 / 5),
                          ],
                        ),
                        childrenDelegate:
                            SliverChildBuilderDelegate(childCount: state.wallpapers.length + 1, (context, index) {
                          if (index == state.wallpapers.length) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: MaterialButton(
                                onPressed: () {
                                  categoryBloc.add(CategoryLoadMoreButtonClicked(name: categoryName));
                                },
                                color: const Color.fromARGB(112, 143, 25, 239),
                                child: const Text(
                                  "Load more",
                                  style: TextStyle(fontSize: 19, color: Colors.white),
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
                                    imageUrl:
                                        index % 3 == 0 ? state.wallpapersLandscape[index] : state.wallpapers[index],
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => SizedBox(
                                      child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Lottie.asset(
                                            "assets/images/99318-hms-loading.json",
                                            height: 25,
                                            width: 25,
                                          )),
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
                                      radius: 12,
                                      onTap: () {
                                        categoryBloc.add(CategoryLikedButtonClicked(
                                          imgUrl: state.wallpapers[index],
                                          imgUrlOrignal: state.wallpapersOrignal[index],
                                        ));
                                      },
                                      child: favoriteGlobal.contains(state.wallpapers[index])
                                          ? const SizedBox(
                                              height: 32,
                                              width: 32,
                                              child: Icon(
                                                Icons.favorite,
                                                size: 25,
                                                color: Colors.red,
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
                        }),
                      ),
                    );
                  } else if (state is CategoryFetchingWallPaperState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Lottie.asset(
                            "assets/images/multi-shape-loader.json",
                            height: 70,
                            width: 100,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 70,
                        // ),
                        // Container(
                        //     height: 45,
                        //     width: 100,
                        //     decoration: BoxDecoration(
                        //       color: Colors.black54,
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     child: InkWell(
                        //       splashColor: Colors.grey,
                        //       borderRadius: BorderRadius.circular(10),
                        //       onTap: () {
                        //         categoryBloc.add(CategoryRefreshEvent(name: categoryName));
                        //       },
                        //       child: const Center(
                        //         child: Text(
                        //           "Refresh",
                        //           style: TextStyle(color: Colors.white, fontSize: 20),
                        //         ),
                        //       ),
                        //     )),
                      ],
                    );
                  } else if (state is CategoryNoWallPaper) {
                    return const Center(
                      child: Text(
                        "No Wallpaper Avilable In This Category",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
