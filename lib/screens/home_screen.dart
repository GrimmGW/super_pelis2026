import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_pelis2026/provider/movies_provider.dart';
import 'package:super_pelis2026/screens/search/movie_search_delegate.dart';
import 'package:super_pelis2026/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
            icon: Icon(Icons.search_rounded)
          )
        ],
        title: Text('SuperPelis', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movie: moviesProvider.nowPlayingMovies,),
            MovieSlider(
              movie: moviesProvider.popularMovies,
              onNextPage: () => moviesProvider.getPopularMovies(),
              widgetName: 'Películas populares',
            ),
          ],
        ),
      ),
    );
  }
}