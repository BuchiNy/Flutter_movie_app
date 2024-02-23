import 'package:flutter/material.dart';
import '../../API/api.dart';
import '../../model/moives.dart';
import '../details/movie_details.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {

  final Api _api = Api();
  List<Movie> _searchResults = [];

  void _handleSearch(String query) {
    setState(() {
    });

    // Call API with the search query and update UI with results
    _fetchSearchResults(query);
  }

  void _fetchSearchResults(String query) {
    _api.searchMovies(query).then((results) {
      setState(() {
        _searchResults = results;
      });
    }).catchError((error) {
      // Handle errors
      print('Error fetching search results: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              onChanged: _handleSearch,
              decoration: const InputDecoration(
                hintText: 'Search movies',
                prefixIcon: Icon(Icons.search,
                color: Colors.white70,),
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  return _buildMovieItem(_searchResults[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieItem(Movie movie) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => InforScreen(movie: movie)
        ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 200,
          width: 1500,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            image: DecorationImage(
              opacity: 0.5,
              image: NetworkImage(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(child: Text(movie.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white70
          ),),),
        ),
      ),
    );
  }
}

