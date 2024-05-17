import 'package:flutter/material.dart';
import '../../export/export.dart';
import '../../model/category_model.dart';
import 'category_wallpapers.dart';

// ignore: must_be_immutable
class CategoryTypes extends StatefulWidget {
  List<TypeCmn> types = [];
  String text;
  CategoryTypes({
    Key? key,
    required this.types,
    required this.text,
  }) : super(key: key);

  @override
  State<CategoryTypes> createState() => _CategoryTypesState();
}

class _CategoryTypesState extends State<CategoryTypes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: widget.types.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: Colors.grey,
            radius: BouncingScrollSimulation.maxSpringTransferVelocity,
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => CategoryDetailed(categoryName: widget.types[index].name)),
              );
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
                        imageUrl: widget.types[index].img,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => SizedBox(
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Lottie.asset(
                              "assets/images/99318-hms-loading.json",
                            ),
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
                              widget.types[index].name,
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
      ),
    );
  }
}
