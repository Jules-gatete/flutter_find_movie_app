import 'dart:convert'; 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  List<dynamic> _movies = [];
  List<dynamic> _favorites = []; 
  bool _isLoading = false;

  var favoriteMovies;

  List<dynamic> get movies => _movies;
  List<dynamic> get favorites => _favorites; 
  bool get isLoading => _isLoading;

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();

    const apiUrl =
        'https://api.themoviedb.org/3/movie/popular?api_key=71403c9eb1fa1cc13a72c8f29243aebb&page=1';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _movies = data['results'] ?? []; 
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      debugPrint('Error fetching movies: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  void addFavorite(dynamic movie) {
    if (!_favorites.contains(movie)) {
      _favorites.add(movie);
      notifyListeners();
    }
  }

  void removeFavorite(dynamic movie) {
    _favorites.remove(movie);
    notifyListeners();
  }

  void toggleFavorite(dynamic movie) {
    if (_favorites.contains(movie)) {
      removeFavorite(movie);
    } else {
      addFavorite(movie);
    }
  }

 
  bool isFavorite(dynamic movie) {
    return _favorites.contains(movie);
  }
}
