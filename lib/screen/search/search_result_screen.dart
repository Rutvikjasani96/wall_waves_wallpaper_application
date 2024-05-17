import 'package:flutter/material.dart';
import '../../export/export.dart';
import '../favorite page/bloc/favorite_bloc.dart';
import '../wallpaper fullscreen/wall_full_screen.dart';
import 'bloc/search_bloc.dart';

// ignore: must_be_immutable
class SearchResultScreen extends StatelessWidget {
  String queryText;
  SearchResultScreen({
    Key? key,
    required this.queryText,
  }) : super(key: key);

  SearchBloc searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    searchBloc.add(SearchButtonClickedEvent(query: queryText));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'searched Wallpapers',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          searchBloc.add(SearcheRefreshCalledEvent());
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<SearchBloc, SearchState>(
                bloc: searchBloc,
                listenWhen: (previous, current) => current is SearchActionState,
                listener: (context, state) {
                  if (state is SearchLoadMoreNoWallpaperState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        backgroundColor: Colors.red.shade400,
                        content: const Text("no more wallpaper avilable in this search"),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SearchedDataFetchedState) {
                    return Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 13,
                          crossAxisSpacing: 13,
                          mainAxisExtent: 300,
                        ),
                        itemCount: state.wallpapers.length + 1,
                        itemBuilder: (context, index) {
                          if (index == state.wallpapers.length) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: MaterialButton(
                                onPressed: () {
                                  searchBloc.add(SearchLoadMoreButtonClickedEvent(query: queryText));
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
                                        searchBloc.add(
                                          SearchFavoriteButtonClickedEvent(
                                            imgUrl: state.wallpapers[index],
                                            imgUrlOrignal: state.wallpapersOrignal[index],
                                          ),
                                        );
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
                  } else if (state is SearchingState) {
                    return Center(
                      child: Lottie.asset(
                        "assets/images/multi-shape-loader.json",
                        height: 70,
                        width: 100,
                      ),
                    );
                  } else if (state is NoSearchWallPaperFoundState) {
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
                            "No More Wallpaper Avilable In This Category",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
