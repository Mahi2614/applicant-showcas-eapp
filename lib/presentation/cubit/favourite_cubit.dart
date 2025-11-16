import 'package:assetwize/presentation/cubit/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assetwize/data/models/asset_model.dart';
import 'package:assetwize/data/repository/favorite_repository.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoritesRepository favRepo;
  FavoriteCubit(this.favRepo) : super(FavoriteInitial());

  Future<void> loadFavorites() async {
    final favs = await favRepo.getFavoritesAsAssets();
    emit(FavoriteLoaded(favs));
  }

  Future<void> toggleFavorite(AssetModel asset) async {
    if (state is FavoriteLoaded) {
      final loaded = state as FavoriteLoaded;
      final exists = loaded.favorites.any((e) => e.id == asset.id);

      if (exists) {
        await favRepo.removeFavorite(asset.id);
      } else {
        await favRepo.addFavorite(asset);
      }

      final updatedFavs = await favRepo.getFavoritesAsAssets();
      emit(FavoriteLoaded(updatedFavs));
    }
  }

  Future<void> removeFavoriteById(String id) async {
    if (state is FavoriteLoaded) {
      await favRepo.removeFavorite(id);
      final updatedFavs = await favRepo.getFavoritesAsAssets();
      emit(FavoriteLoaded(updatedFavs));
    }
  }

  bool isFavorite(String id) {
    if (state is FavoriteLoaded) {
      return (state as FavoriteLoaded).favorites.any((e) => e.id == id);
    }
    return false;
  }
}
