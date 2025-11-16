import 'package:assetwize/core/constants/app_colors.dart';
import 'package:assetwize/data/models/asset_model.dart';
import 'package:assetwize/data/repository/favorite_repository.dart';
import 'package:assetwize/domain/use_cases/get_arts_item_usecase.dart';
import 'package:assetwize/presentation/cubit/favourite_cubit.dart';
import 'package:assetwize/presentation/cubit/favorites_state.dart';
import 'package:assetwize/presentation/cubit/items_cubit/arts_cubit.dart';
import 'package:assetwize/presentation/widgets/add_new_item_tile.dart';
import 'package:assetwize/presentation/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtsListScreen extends StatelessWidget {
  const ArtsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width > 600;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final cubit = ArtCubit(GetArtItemsUseCase());
            cubit.fetchArtItems();
            return cubit;
          },
        ),
        BlocProvider(
          create: (_) => FavoriteCubit(FavoritesRepository())..loadFavorites(),
        ),
      ],
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                AddNewItemTile(
                  title: "New Arts",
                  subtitle: "Curate your Arts collection.",
                  icon: Icons.arrow_forward,
                  onTap: () {},
                ),
                const SizedBox(height: 12),

                // Listen to both ArtsCubit and FavoriteCubit
                BlocBuilder<ArtCubit, ArtState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final items = state.items;

                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return BlocBuilder<FavoriteCubit, FavoriteState>(
                          builder: (context, favState) {
                            final favCubit = context.read<FavoriteCubit>();

                            Widget buildItem(AssetModel asset, bool isFav) {
                              return ItemCard(
                                imagePath: asset.imagePath,
                                title: asset.title,
                                id: asset.id,
                                detail: asset.detail,
                                company: asset.company,
                                isFavorite: isFav,
                                onFavoriteToggle: () {
                                  favCubit.toggleFavorite(asset);
                                },
                              );
                            }

                            if (isWideScreen) {
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(bottom: 20),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: _getCrossAxisCount(
                                        constraints.maxWidth,
                                      ),
                                      crossAxisSpacing:
                                          constraints.maxWidth * 0.015,
                                      mainAxisSpacing:
                                          constraints.maxWidth * 0.015,
                                      childAspectRatio: _getAspectRatio(
                                        constraints.maxWidth,
                                      ),
                                    ),
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  final item = items[index];
                                  final asset = AssetModel(
                                    id: item.id,
                                    title: item.title,
                                    imagePath: item.imagePath,
                                    company: item.company,
                                    detail: item.detail,
                                    category: "",
                                  );
                                  bool isFav = false;
                                  if (favState is FavoriteLoaded) {
                                    isFav = favState.favorites.any(
                                      (e) => e.id == item.id,
                                    );
                                  }
                                  return buildItem(asset, isFav);
                                },
                              );
                            } else {
                              return Column(
                                children: items.map((item) {
                                  final asset = AssetModel(
                                    id: item.id,
                                    title: item.title,
                                    imagePath: item.imagePath,
                                    company: item.company,
                                    detail: item.detail,
                                    category: "",
                                  );
                                  bool isFav = false;
                                  if (favState is FavoriteLoaded) {
                                    isFav = favState.favorites.any(
                                      (e) => e.id == item.id,
                                    );
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: buildItem(asset, isFav),
                                  );
                                }).toList(),
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
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
