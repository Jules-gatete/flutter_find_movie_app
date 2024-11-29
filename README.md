# Film Finder: Discover Your Next Favorite Movie 🎥

Film Finder is a mobile application built with Flutter that allows users to explore trending movies, view detailed information, and save their favorites. The app fetches movie data from the TMDb (The Movie Database) API and provides a seamless, visually appealing user experience.

## Features
- **Welcome Screen**: A visually appealing welcome screen with animations and a "Get Started" button.
- **Home Screen**: Displays a list of trending movies fetched from the TMDb API. Includes responsive design and smooth scrolling.
- **Favorites Feature**: Users can save movies to their favorites list. State is managed using the `Provider` package.
- **Movie Details Screen**: Provides in-depth details about selected movies, including their overviews and posters.
- **Error Handling**: Displays fallback messages or icons for missing data or failed network requests.

## Screens
1. **Welcome Screen**: Introduces the app with a stylish design.
2. **Home Screen**: Shows a list of trending movies with their titles, posters, and release dates.
3. **Favorites Screen**: Lists all movies marked as favorites by the user.
4. **Movie Details Screen**: Displays comprehensive details about a selected movie.

## Tech Stack
- **Frontend**: Flutter, Dart
- **API Integration**: TMDb API
- **State Management**: Provider

## Challenges Faced
- Managing state across screens and widgets, resolved using the `Provider` package.
- Handling API errors gracefully to ensure a smooth user experience.
- Designing a responsive UI that adapts to both portrait and landscape modes.

## How to Run
1. Clone the repository:
   ```bash
   git clone <[repository-link](https://github.com/Jules-gatete/flutter_find_movie_app.git)>

Navigate to the project directory:
 cd flutter_find_movie_app


Install dependencies:
 flutter pub get


Run the app on an emulator or connected device:
 flutter run


Demo Video
Watch the app walkthrough: Film Finder Demo [https://youtu.be/GhrGeaKehDw)
GitHub Repository
Find the codebase here: Film Finder GitHub [https://github.com/Jules-gatete/flutter_find_movie_app.git)
