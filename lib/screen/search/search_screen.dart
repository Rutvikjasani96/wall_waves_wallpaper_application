import 'package:flutter/material.dart';
import 'package:wall_waves_wallpaper_application/screen/search/search_result_screen.dart';

import '../../export/export.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController query = TextEditingController();
  // SearchBloc searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          // height: 50,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 7),
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.purple),
          ),
          child: TextField(
            controller: query,
            onChanged: (value) {},
            cursorColor: Colors.purple,
            cursorHeight: 21,
            onSubmitted: (value) {
              if (query.text.isNotEmpty) {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SearchResultScreen(queryText: query.text),
                  ),
                );
              }
            },
            decoration: const InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.black54, fontSize: 15),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
            ),
            style: const TextStyle(color: Colors.purple),
          ),
        ),
        leadingWidth: double.maxFinite,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (query.text.isNotEmpty) {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => SearchResultScreen(queryText: query.text),
                ),
              );
            }
          },
          child: const Text('Search'),
        ),
      ),
    );
  }
}
