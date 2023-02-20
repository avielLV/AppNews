import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  final _urlNews = 'https://newsapi.org/';
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.baseballBatBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];
  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    for (var item in categories) {
      categoryArticles[item.name] = List.empty();
    }
  }
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;

    getArticclesByCategory(value);
    notifyListeners();
  }

  List<Article>? get getArticulosCategoriaSeleccionada =>
      categoryArticles[selectedCategory];

  getTopHeadlines() async {
    final url = Uri.parse(
        '${_urlNews}v2/top-headlines?country=us&apiKey=69ac0b8f2e574c9786d7e1f76bc16121');
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticclesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }
    final url = Uri.parse(
        '${_urlNews}v2/top-headlines?country=us&apiKey=69ac0b8f2e574c9786d7e1f76bc16121&category=${category}');
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);
    categoryArticles[category] = newsResponse.articles;
    notifyListeners();
  }
}
