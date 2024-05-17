
// home screen grid view
// child: GridView.builder(
                      //   physics: const BouncingScrollPhysics(),
                      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2,
                      //     mainAxisSpacing: 13,
                      //     crossAxisSpacing: 13,
                      //     mainAxisExtent: 300,
                      //   ),
                      //   itemCount: wallpapers.length,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return Stack(
                      //       fit: StackFit.passthrough,
                      //       children: [
                      //         ClipRRect(
                      //           borderRadius: BorderRadius.circular(10),
                      //           child: InkWell(
                      //             onTap: () {
                      //               Navigator.push(
                      //                 context,
                      //                 CupertinoPageRoute(
                      //                   builder: (context) => WallFullScreen(imageUrl: wallpapersOrignal[index]),
                      //                 ),
                      //               );
                      //             },
                      //             child: CachedNetworkImage(
                      //               imageUrl: wallpapers[index],
                      //               fit: BoxFit.cover,
                      //               placeholder: (context, url) => SizedBox(
                      //                 child: Lottie.asset(
                      //                   "assets/images/99318-hms-loading.json",
                      //                   height: 100,
                      //                   width: 100,
                      //                 ),
                      //               ),
                      //               errorWidget: (context, url, error) => const Icon(Icons.error),
                      //             ),
                      //           ),
                      //         ),
                      //         Positioned(
                      //           top: 10,
                      //           right: 10,
                      //           child: Container(
                      //             height: 40,
                      //             width: 40,
                      //             decoration: const BoxDecoration(color: Colors.white54, shape: BoxShape.circle),
                      //             child: GestureDetector(
                      //               onTap: () {
                      //                 setState(() {
                      //                   liked[index] = !liked[index];
                      //                 });
                      //               },
                      //               child: liked[index]
                      //                   ? const Icon(
                      //                       Icons.favorite,
                      //                       size: 25,
                      //                       color: Colors.red,
                      //                     )
                      //                   : const Icon(
                      //                       Icons.favorite_border,
                      //                       size: 25,
                      //                     ),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     );
                      //   },
                      // ),







// category detail screen grid view

   // child: GridView.builder(
                      //   physics: const BouncingScrollPhysics(),
                      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2,
                      //     mainAxisSpacing: 13,
                      //     crossAxisSpacing: 13,
                      //     mainAxisExtent: 300,
                      //   ),
                      //   itemCount: wallpapers.length,
                      //   itemBuilder: (BuildContext context, int index) {
                      // return Stack(
                      //   fit: StackFit.passthrough,
                      //   children: [
                      //     ClipRRect(
                      //       borderRadius: BorderRadius.circular(25),
                      //       child: InkWell(
                      //         onTap: () {
                      //           Navigator.push(
                      //             context,
                      //             CupertinoPageRoute(
                      //               builder: (context) => WallFullScreen(imageUrl: wallpapersOrignal[index]),
                      //             ),
                      //           );
                      //         },
                      //         child: CachedNetworkImage(
                      //           imageUrl: wallpapers[index],
                      //           fit: BoxFit.cover,
                      //           placeholder: (context, url) => SizedBox(
                      //             child: SizedBox(
                      //                 height: 50,
                      //                 width: 50,
                      //                 child: Lottie.asset(
                      //                   "assets/images/99318-hms-loading.json",
                      //                   height: 25,
                      //                   width: 25,
                      //                 )),
                      //           ),
                      //           errorWidget: (context, url, error) => const Icon(Icons.error),
                      //         ),
                      //       ),
                      //     ),
                      //     Positioned(
                      //       top: 10,
                      //       right: 10,
                      //       child: Container(
                      //         height: 40,
                      //         width: 40,
                      //         decoration: const BoxDecoration(color: Colors.white54, shape: BoxShape.circle),
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             setState(() {
                      //               liked[index] = !liked[index];
                      //             });
                      //           },
                      //           child: liked[index]
                      //               ? const Icon(
                      //                   Icons.favorite,
                      //                   size: 25,
                      //                   color: Colors.red,
                      //                 )
                      //               : const Icon(
                      //                   Icons.favorite_border,
                      //                   size: 25,
                      //                 ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // );
                      //   },
                      // ),