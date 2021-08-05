import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProviders extends ChangeNotifier {
  String _apiKey = '1e7a77e826c5e634dbd1566364704f8d';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProviders() {
    print('Movie provider inicializado');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  // _getJsonData(){

  // }

  getOnDisplayMovies() async {
    var url = Uri.https(
      _baseUrl,
      '3/movie/now_playing',
      {
        'api_key': _apiKey,
        'language': _language,
        'page': '1',
      },
    );
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(
      _baseUrl,
      '3/movie/popular',
      {
        'api_key': _apiKey,
        'language': _language,
        'page': '1',
      },
    );
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }
}
