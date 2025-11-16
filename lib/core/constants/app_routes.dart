import 'package:assetwize/presentation/screens/favourites_screen.dart';
import 'package:assetwize/presentation/screens/search_screen.dart';
import 'package:assetwize/presentation/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:assetwize/presentation/screens/home_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String favourites = '/favourites';
  static const String search = '/search';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    favourites: (context) => const FavouritesScreen(),
    search: (context) => const SearchScreen(),
    settings: (context) => const SettingScreen(),
  };
}
