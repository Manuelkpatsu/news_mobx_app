import 'package:flutter/material.dart';
import 'package:news_mobx_app/stores/favorites_store.dart';

class FavoritesScreen extends StatefulWidget {
  final FavoritesStore store;

  const FavoritesScreen(this.store, {Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
