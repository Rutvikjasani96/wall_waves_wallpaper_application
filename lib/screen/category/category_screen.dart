import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../export/export.dart';
import '../../model/category_model.dart';
import '../../utils/colors.dart';
import '../search/search_screen.dart';
import 'category_types.dart';
import 'category_wallpapers.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List tabs = [
    'All',
    'Agriculture',
    'Trending',
    'Night Out',
    'Rock',
    'Music',
    'Sunset',
    'Sunrise',
    'Valentine',
    'Birthday',
  ];
  List<List<dynamic>> color = [
    [Colors.black, "Black"],
    [Colors.blue, "Blue"],
    [Colors.purple, "Purple"],
    [Colors.brown, "Brown"],
    [Colors.orange, "Orange"],
    [Colors.red, "Red"],
    [Colors.white, "White"],
    [Colors.yellow, "Yellow"],
    [Colors.green, "Green"],
    [Colors.pink, "Pink"],
    [Colors.teal, "Teal"],
    [Colors.grey, "Grey"],
    [Colors.cyan, "Cyan"],
    [Colors.indigo, "Indigo"],
    [Colors.amber, "Amber Color"],
  ];
  List images = [
    "assets/images/Group 89.png",
    "assets/images/Group 80.png",
    "assets/images/Group 91.png",
    "assets/images/Frame 1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "CATEGORY",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ClipOval(
                child: Material(
                  color: Colors.black54,
                  child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const SearchScreen(),
                          ),
                        );
                      },
                      child: const SizedBox(
                        height: 40,
                        width: 40,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.search,
                            size: 22,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ).animate(delay: 500.milliseconds).shimmer(duration: 1000.milliseconds),
        ),
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BounceInUp(
                  child: SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tabs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          radius: 3,
                          onTap: () {
                            if (index != 0) {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => CategoryDetailed(categoryName: tabs[index]),
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index == 0 ? Colors.blueGrey.shade300 : AppColors.background,
                                border: Border.all(
                                  color: AppColors.offWhite,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(0.2),
                                    offset: const Offset(0, 7),
                                    blurRadius: 7,
                                  )
                                ]),
                            child: Text(
                              tabs[index],
                              style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ).animate(delay: 500.milliseconds).shimmer(duration: 1000.milliseconds),
                ),
                BounceInUp(
                  child: SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: color.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          radius: 1,
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => CategoryDetailed(categoryName: color[index][1]),
                              ),
                            );
                          },
                          child: SizedBox(
                            child: Container(
                              height: 50,
                              width: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 5,
                                    // blurStyle: 1,
                                    offset: const Offset(3, 3),
                                  )
                                ],
                                color: color[index][0],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ).animate(delay: 500.milliseconds).shimmer(duration: 1000.milliseconds),
                ),
                const SizedBox(height: 10),
                BounceInUp(
                  child: const Text(
                    " Recommend",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ).animate(delay: 500.milliseconds).shimmer(duration: 1000.milliseconds),
                ),
                const SizedBox(height: 7),
                // FadeIn(
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     physics: const BouncingScrollPhysics(),
                //     scrollDirection: Axis.vertical,
                //     itemCount: category.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return FutureBuilder(
                //         future: precacheImage(AssetImage(category[index].img), context),
                //         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                //           if (snapshot.connectionState == ConnectionState.waiting) {
                //             return Container(
                //               height: 150,
                //               width: double.maxFinite,
                //               margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                //               child: Center(
                //                 child: Lottie.asset(
                //                   "assets/images/multi-shape-loader.json",
                //                   height: 70,
                //                   width: 100,
                //                 ), // Display a loading indicator
                //               ),
                //             );
                //           } else if (snapshot.hasError) {
                //             return Container(
                //               height: 150,
                //               width: double.maxFinite,
                //               margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                //               child: const Center(
                //                 child: Text('Error loading image'), // Display an error message
                //               ),
                //             );
                //           } else {
                //             return InkWell(
                //               splashColor: Colors.grey,
                //               radius: BouncingScrollSimulation.maxSpringTransferVelocity,
                //               borderRadius: BorderRadius.circular(10),
                //               onTap: () {
                //                 if (category[index].type.isEmpty) {
                //                   Navigator.push(
                //                     context,
                //                     CupertinoPageRoute(
                //                       builder: (context) => CategoryDetailed(categoryName: category[index].name),
                //                     ),
                //                   );
                //                 } else {
                //                   Navigator.push(
                //                     context,
                //                     CupertinoPageRoute(
                //                       builder: (context) =>
                //                           CategoryTypes(types: category[index].type, text: category[index].name),
                //                     ),
                //                   );
                //                 }
                //               },
                //               child: Container(
                //                 height: 150,
                //                 width: double.maxFinite,
                //                 margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                //                 padding: const EdgeInsets.only(left: 20),
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(10),
                //                   image: DecorationImage(
                //                     image: AssetImage(category[index].img),
                //                     fit: BoxFit.cover,
                //                   ),
                //                 ),
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     Row(
                //                       children: [
                //                         Text(
                //                           category[index].name,
                //                           style: const TextStyle(
                //                             color: Colors.white,
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: 30,
                //                           ),
                //                         ),
                //                       ],
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             );
                //           }
                //         },
                //       );
                //     },
                //   ),
                // ),

                BounceInUp(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: category.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        splashColor: Colors.grey,
                        radius: BouncingScrollSimulation.maxSpringTransferVelocity,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          if (category[index].type.isEmpty) {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => CategoryDetailed(categoryName: category[index].name),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    CategoryTypes(types: category[index].type, text: category[index].name),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 150,
                          width: double.maxFinite,
                          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                          child: Stack(
                            children: [
                              Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: category[index].img,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => SizedBox(
                                      child: Lottie.asset(
                                        "assets/images/99318-hms-loading.json",
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Text(
                                          category[index].name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).animate(delay: 500.milliseconds).shimmer(duration: 1000.milliseconds),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
