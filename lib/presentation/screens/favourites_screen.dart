import 'package:assetwize/presentation/cubit/favorites_state.dart';
import 'package:assetwize/presentation/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assetwize/data/repository/favorite_repository.dart';
import 'package:assetwize/core/constants/app_colors.dart';
import 'package:assetwize/presentation/widgets/item_card.dart';
import 'package:assetwize/data/models/asset_model.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteCubit(FavoritesRepository())..loadFavorites(),
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: const Text(
            "Favorites",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(color: bordercolor, height: 1),
          ),
        ),
        body: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoriteLoaded) {
              if (state.favorites.isEmpty) {
                return const Center(child: Text("No favorites yet!"));
              }

              return LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: state.favorites.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _getCrossAxisCount(constraints.maxWidth),
                      crossAxisSpacing: constraints.maxWidth * 0.015,
                      mainAxisSpacing: constraints.maxWidth * 0.015,
                      childAspectRatio: _getAspectRatio(constraints.maxWidth),
                    ),
                    itemBuilder: (context, index) {
                      final item = state.favorites[index];

                      final asset = AssetModel(
                        id: item.id,
                        title: item.title,
                        imagePath: item.imagePath,
                        company: item.company,
                        detail: item.detail,
                        category: "",
                      );

                      return ItemCard(
                        id: item.id,
                        title: item.title,
                        imagePath: item.imagePath,
                        detail: item.detail,
                        company: item.company,
                        isFavorite: true,
                        onFavoriteToggle: () {
                          context.read<FavoriteCubit>().toggleFavorite(asset);
                        },
                      );
                    },
                  );
                },
              );
            } else if (state is FavoriteError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

int _getCrossAxisCount(double width) {
  if (width > 1200) return 4; // Web / Large tablet
  if (width > 900) return 3; // Tablets
  if (width > 600) return 2; // Big phones / small tablets
  return 1; // Mobile
}

double _getAspectRatio(double width) {
  if (width > 1200) return 0.80;
  if (width > 900) return 0.80;
  if (width > 600) return 0.75;
  return 0.95; // mobile
}
