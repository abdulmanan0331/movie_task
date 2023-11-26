import 'package:flutter/material.dart';
import 'package:movie_task/model/movie.dart';

class MovieProvider with ChangeNotifier {
  List<MovieModel> _favoriteItems = [];

  List<MovieModel> get favoriteItems => _favoriteItems;

  void addToFavorites(MovieModel movie) {
    _favoriteItems.add(movie);
    notifyListeners();
  }

  void removeFromFavorites(MovieModel movie) {
    _favoriteItems.remove(movie);
    notifyListeners();
  }
}
