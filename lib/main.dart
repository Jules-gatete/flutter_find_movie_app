import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'movie_provider.dart';

void main() {
  runApp(const FilmFinderApp());
}

class FilmFinderApp extends StatelessWidget {
  const FilmFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieProvider()..fetchMovies(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trends in Movies',
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/img1.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey,
                alignment: Alignment.center,
                child: const Text(
                  'Image not available',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to \n Movie Finder App',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 200),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF872727),
                      ),
                    ),
                    
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/home'),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(30),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
