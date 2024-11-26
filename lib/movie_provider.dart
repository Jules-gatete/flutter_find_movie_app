import 'dart:convert'; // For JSON decoding
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  List<dynamic> _movies = [];
  bool _isLoading = false;

  List<dynamic> get movies => _movies;
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
        _movies = data['results'] ?? []; // Extract the list of movies
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      debugPrint('Error fetching movies: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
