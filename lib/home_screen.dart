import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie_provider.dart';
import 'movie_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final filteredMovies = _searchQuery.isEmpty
        ? movieProvider.movies
        : movieProvider.movies.where((movie) {
            final title = movie['title']?.toLowerCase() ?? '';
            return title.contains(_searchQuery.toLowerCase());
          }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: TextField(
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: movieProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : filteredMovies.isEmpty
              ? const Center(
                  child: Text(
                    'No movies match your search.',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: filteredMovies.length,
                  itemBuilder: (context, index) {
                    final movie = filteredMovies[index];
                    return ListTile(
                      leading: movie['poster_path'] != null
                          ? Image.network(
                              'https://image.tmdb.org/t/p/w200${movie['poster_path']}',
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.movie),
                      title: Text(movie['title'] ?? 'Untitled'),
                      subtitle:
                          Text(movie['release_date'] ?? 'Release date unknown'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailScreen(movie: movie),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
