import 'dart:convert';
import '../model/moives.dart';
import '../widget/Const.dart';
import 'package:http/http.dart' as http;

class Api{
  static const _trendingURL = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _PopularURL = 'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';
  static const _TVshowsURL = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  // This method searches for movies based on the provided query
  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}&query=$query'));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJSON(movie)).toList();
    } else {
      throw Exception("Something happened");
    }
  }

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingURL));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJSON(movie)).toList();
    }else{
      throw Exception("Something happened");
    }
  }

  Future<List<Movie>> getPopulargMovies() async {
    final response = await http.get(Uri.parse(_PopularURL));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJSON(movie)).toList();
    }else{
      throw Exception("Something happened");
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_TVshowsURL));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((tvshow) => Movie.fromJSON(tvshow)).toList();
    }else{
      throw Exception("Something happened");
    }
  }
}