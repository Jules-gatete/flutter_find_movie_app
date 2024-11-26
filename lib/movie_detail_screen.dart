import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  final dynamic movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie['title'] ?? 'Movie Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.broken_image,
                size: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                movie['overview'] ?? 'No overview available.',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
