import 'package:cineinsight/models/movie.dart';
import 'package:cineinsight/views/widgets/upcoming_movie.dart';
import 'package:flutter/material.dart';
import 'package:cineinsight/models/movie.api.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Movie> _movies ;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _movies = [];
    getMovies();
  }

  Future<void> getMovies() async {
    try {
      _movies = await MovieApi.getMovies();
    } catch (e) {
      print('Error fetching movies: $e');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie),
            SizedBox(width: 10),
            Text('CineInsight'),
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                return MovieList(
                  title: _movies[index].title,
                  description: _movies[index].description,
                  rating: _movies[index].rating.toString(),
                  thumbnailUrl: _movies[index].bigImage,
                );
              },
            ),
    );
  }
}
