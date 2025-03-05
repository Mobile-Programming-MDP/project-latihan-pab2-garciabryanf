import 'package:aplikasi_movie/models/movie.dart';
import 'package:aplikasi_movie/screens/detail_screen.dart';
import 'package:aplikasi_movie/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<List<Movie>>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = _loadMovies();
  }

  Future<List<List<Movie>>> _loadMovies() async {
    try {
      final allMoviesData = await _apiService.getAllMovies();
      final trendingMoviesData = await _apiService.getTrendingMovies();
      final popularMoviesData = await _apiService.getPopularMovies();

      return [
        allMoviesData.map((e) => Movie.fromJson(e)).toList(),
        trendingMoviesData.map((e) => Movie.fromJson(e)).toList(),
        popularMoviesData.map((e) => Movie.fromJson(e)).toList(),
      ];
    } catch (e) {
      debugPrint("Error loading movies: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pilem')),
      body: FutureBuilder<List<List<Movie>>>(
        future: _moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text("Failed to load movies"));
          }

          final allMovies = snapshot.data![0];
          final trendingMovies = snapshot.data![1];
          final popularMovies = snapshot.data![2];

          return ListView(
            children: [
              _buildMoviesList('All Movies', allMovies),
              _buildMoviesList('Trending Movies', trendingMovies),
              _buildMoviesList('Popular Movies', popularMovies),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMoviesList(String title, List<Movie> movies) {
    if (movies.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "$title - No movies available",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              final Movie movie = movies[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(movie: movie),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const SizedBox(
                              height: 150,
                              width: 100,
                              child: Center(child: CircularProgressIndicator()),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              height: 150,
                              width: 100,
                              child: Center(child: Icon(Icons.broken_image, size: 50)),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 100,
                        child: Text(
                          movie.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
