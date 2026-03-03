import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/post.dart';
import '../services/api_service.dart';

class PostProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Post> _posts = [];
  List<Post> _favorites = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Post> get posts => _posts;
  List<Post> get favorites => _favorites;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  List<Post> get filteredPosts {
    if (_searchQuery.isEmpty) return _posts;
    return _posts
        .where(
          (p) =>
              p.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              p.body.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  final String _favoritesKey = 'favorite_posts';

  PostProvider() {
    loadFavorites();
  }

  Future<void> fetchPosts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _posts = await _apiService.fetchPosts();
    } catch (e) {
      print('DEBUG: PostProvider Error: $e');
      _errorMessage = e.toString();
      // Offline fallback: Use favorites if fetch fails
      if (_posts.isEmpty) {
        _posts = List.from(_favorites);
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite(Post post) {
    bool isFav = isFavorite(post);
    if (isFav) {
      _favorites.removeWhere((p) => p.id == post.id);
    } else {
      _favorites.add(post);
    }
    saveFavorites();
    notifyListeners();
  }

  bool isFavorite(Post post) {
    return _favorites.any((p) => p.id == post.id);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favJson = _favorites
        .map((p) => json.encode(p.toJson()))
        .toList();
    await prefs.setStringList(_favoritesKey, favJson);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favJson = prefs.getStringList(_favoritesKey);
    if (favJson != null) {
      _favorites = favJson.map((s) => Post.fromJson(json.decode(s))).toList();
      notifyListeners();
    }
  }
}
