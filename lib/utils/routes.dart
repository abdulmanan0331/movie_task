import 'package:flutter/material.dart';
import 'package:movie_task/all_screen.dart';

final Map<String, WidgetBuilder> routes = {
  MoviePage.routeName: (context) => const MoviePage(),
  FavoriatePage.routeName: (context) => const FavoriatePage(),
};
