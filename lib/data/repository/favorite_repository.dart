import 'package:shared_preferences/shared_preferences.dart';
import 'package:assetwize/data/models/asset_model.dart';
import 'dart:convert';

class FavoritesRepository {
  static const String _key = 'favorites';

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_key) ?? [];
    return data.map((e) => json.decode(e) as Map<String, dynamic>).toList();
  }

  Future<List<AssetModel>> getFavoritesAsAssets() async {
    final maps = await getFavorites();
    return maps.map((m) => AssetModel.fromMap(m)).toList();
  }

  Future<void> addFavorite(AssetModel asset) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    list.add(json.encode(asset.toMap()));
    await prefs.setStringList(_key, list);
  }

  Future<void> removeFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    list.removeWhere(
      (e) => (json.decode(e) as Map<String, dynamic>)['id'] == id,
    );
    await prefs.setStringList(_key, list);
  }
}
