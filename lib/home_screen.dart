import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie_provider.dart';
import 'favorites_screen.dart';
import 'movie_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 140, 23, 23),
        iconTheme: const IconThemeData(
          color: Colors.white, 
        ),
        toolbarTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold, 
          fontSize: 18,
        ),
        actionsIconTheme: const IconThemeData(
          color: Colors.white, 
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: movieProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movieProvider.movies.length,
              itemBuilder: (context, index) {
                final movie = movieProvider.movies[index];
                final isFavorite = movieProvider.isFavorite(movie);

                return ListTile(
                  leading: SizedBox(
                    width: 50,
                    child: movie['poster_path'] != null
                        ? Image.network(
                            'https://image.tmdb.org/t/p/w200${movie['poster_path']}',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                          )
                        : const Icon(Icons.movie),
                  ),
                  title: Text(movie['title'] ?? 'Untitled'),
                  subtitle:
                      Text(movie['release_date'] ?? 'Release date unknown'),
                  trailing: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite
                          ? const Color.fromARGB(255, 140, 23, 23)
                          : null, 
                    ),
                    onPressed: () {
                      
                      movieProvider.toggleFavorite(movie);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(movie: movie),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
