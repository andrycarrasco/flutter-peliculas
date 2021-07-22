import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProviders extends ChangeNotifier {
  String _apiKey = '1e7a77e826c5e634dbd1566364704f8d';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';
  MoviesProviders() {
    print('Movie provider inicializado');
    this.getOnDisplayMovies();
  }

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
    final Map<String, dynamic> decodedData = json.decode(response.body);
    print(decodedData['results']);
  }
}
