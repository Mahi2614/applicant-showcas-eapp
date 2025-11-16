import 'package:assetwize/core/constants/app_colors.dart';
import 'package:assetwize/data/models/asset_model.dart';
import 'package:assetwize/data/repository/asset_repository.dart';
import 'package:assetwize/data/repository/favorite_repository.dart';
import 'package:assetwize/presentation/cubit/favorites_state.dart';
import 'package:assetwize/presentation/cubit/favourite_cubit.dart';
import 'package:assetwize/presentation/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";
  List<AssetModel> results = [];

  void _searchAssets(String value) {
    setState(() {
      query = value.trim();
      results = AssetRepository.allAssets.where((asset) {
        final q = query.toLowerCase();
        return asset.title.toLowerCase().contains(q) ||
            asset.company.toLowerCase().contains(q) ||
            asset.detail.toLowerCase().contains(q);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteCubit(FavoritesRepository())..loadFavorites(),
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: const Text(
            "Search",
            style: TextStyle(fontWeight: FontWeight.bold, color: black),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(color: bordercolor, height: 1),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                onChanged: _searchAssets,
                decoration: InputDecoration(
                  hintText: "Search all assets...",
                  filled: true,
                  fillColor: lightGrey.withOpacity(0.4),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: results.isEmpty
                    ? Center(
                        child: query.isEmpty
                            ? const Text("Type something to search")
                            : const Text("No results found"),
                      )
                    : BlocBuilder<FavoriteCubit, FavoriteState>(
                        builder: (context, state) {
                          final cubit = context.read<FavoriteCubit>();

                          return LayoutBuilder(
                            builder: (context, constraints) {
                              return GridView.builder(
                                itemCount: results.length,
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
                                itemBuilder: (context, index) {
                                  final asset = results[index];
                                  final isFavorite = cubit.isFavorite(asset.id);

                                  return ItemCard(
                                    title: asset.title,
                                    imagePath: asset.imagePath,
                                    detail: asset.detail,
                                    company: asset.company,
                                    id: asset.id,
                                    onFavoriteToggle: () => context
                                        .read<FavoriteCubit>()
                                        .toggleFavorite(asset),
                                    isFavorite: isFavorite,
                                  );
                                },
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

int _getCrossAxisCount(double width) {
  if (width > 1200) return 4;
  if (width > 900) return 3;
  if (width > 600) return 2;
  return 1;
}

double _getAspectRatio(double width) {
  if (width > 1200) return 0.80;
  if (width > 900) return 0.80;
  if (width > 600) return 0.75;
  return 0.95;
}
