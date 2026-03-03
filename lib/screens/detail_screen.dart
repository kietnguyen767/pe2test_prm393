import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/post.dart';
import '../providers/post_provider.dart';

class DetailScreen extends StatelessWidget {
  final Post post;

  const DetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          Consumer<PostProvider>(
            builder: (context, provider, child) {
              bool isFav = provider.isFavorite(post);
              return IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  provider.toggleFavorite(post);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isFav ? 'Removed from favorites' : 'Added to favorites',
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'post-title-${post.id}',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              Text(
                post.body,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Consumer<PostProvider>(
                  builder: (context, provider, child) {
                    bool isFav = provider.isFavorite(post);
                    return ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                      ),
                      label: Text(
                        isFav ? 'Remove from Favorites' : 'Add to Favorites',
                      ),
                      onPressed: () {
                        provider.toggleFavorite(post);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isFav
                                  ? 'Removed from favorites'
                                  : 'Added to favorites',
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
