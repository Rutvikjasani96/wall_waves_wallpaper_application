import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'dependency_injection.dart';
import 'screen/main screen/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  var wallpapers = await Hive.openBox('wallpapers');
  var wallpapersOrignal = await Hive.openBox('wallpapersOrignal');
  final favoritesGlobalH = await Hive.openBox('favorites');
  final favoritesGlobalOrignalH = await Hive.openBox('favoritesGlobal');

  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
