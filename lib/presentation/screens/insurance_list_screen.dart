import 'package:assetwize/core/constants/app_colors.dart';
import 'package:assetwize/data/models/asset_model.dart';
import 'package:assetwize/data/repository/favorite_repository.dart';
import 'package:assetwize/domain/use_cases/get_insurance_item_usecase.dart';
import 'package:assetwize/presentation/cubit/favorites_state.dart';
import 'package:assetwize/presentation/cubit/favourite_cubit.dart';
import 'package:assetwize/presentation/cubit/items_cubit/insurance_cubit.dart';
import 'package:assetwize/presentation/screens/add_insurance_page.dart';
import 'package:assetwize/presentation/widgets/add_new_item_tile.dart';
import 'package:assetwize/presentation/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsuranceListScreen extends StatelessWidget {
  const InsuranceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              InsuranceCubit(GetInsuranceItemsUseCase())..fetchInsuranceItems(),
        ),
        BlocProvider(
          create: (_) => FavoriteCubit(FavoritesRepository())..loadFavorites(),
        ),
      ],
      child: Scaffold(
        backgroundColor: white,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddInsurancePage()),
            );

            if (result == true) {
              context.read<InsuranceCubit>().fetchInsuranceItems();
            }
          },
          backgroundColor: const Color.fromRGBO(241, 191, 84, 1),
          icon: const Icon(Icons.add, color: white),
          label: const Text(
            "New Insurance",
            style: TextStyle(color: white, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body: BlocBuilder<InsuranceCubit, InsuranceState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final items = state.items;

            return LayoutBuilder(
              builder: (context, constraints) {
                final bool isTablet = constraints.maxWidth > 600;

                return ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 20),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: AddNewItemTile(
                        title: "New Insurance",
                        subtitle:
                            "Ask AI to help you understand your insurance.",
                        icon: Icons.arrow_forward,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 0,
                      ),
                      child: BlocBuilder<FavoriteCubit, FavoriteState>(
                        builder: (context, favState) {
                          final favCubit = context.read<FavoriteCubit>();

                          if (isTablet) {
                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
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

                                return ItemCard(
                                  id: item.id,
                                  imagePath: item.imagePath,
                                  title: item.title,
                                  detail: item.detail,
                                  company: item.company,
                                  isFavorite: favCubit.isFavorite(item.id),
                                  onFavoriteToggle: () {
                                    favCubit.toggleFavorite(
                                      AssetModel(
                                        id: item.id,
                                        title: item.title,
                                        imagePath: item.imagePath,
                                        company: item.company,
                                        detail: item.detail,
                                        category: "",
                                      ),
                                    );
                                  },
                                  buttonText: "AI Assistant",
                                  onPressed: () {},
                                );
                              },
                            );
                          }
                          if (!isTablet) {
                            return Column(
                              children: List.generate(items.length, (index) {
                                final item = items[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 4,
                                  ),
                                  child: ItemCard(
                                    id: item.id,
                                    imagePath: item.imagePath,
                                    title: item.title,
                                    detail: item.detail,
                                    company: item.company,
                                    isFavorite: favCubit.isFavorite(item.id),
                                    onFavoriteToggle: () {
                                      favCubit.toggleFavorite(
                                        AssetModel(
                                          id: item.id,
                                          title: item.title,
                                          imagePath: item.imagePath,
                                          company: item.company,
                                          detail: item.detail,
                                          category: "",
                                        ),
                                      );
                                    },
                                    buttonText: "AI Assistant",
                                    onPressed: () {},
                                  ),
                                );
                              }),
                            );
                          }

                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 8),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];

                              return ItemCard(
                                id: item.id,
                                imagePath: item.imagePath,
                                title: item.title,
                                detail: item.detail,
                                company: item.company,
                                isFavorite: favCubit.isFavorite(item.id),
                                onFavoriteToggle: () {
                                  favCubit.toggleFavorite(
                                    AssetModel(
                                      id: item.id,
                                      title: item.title,
                                      imagePath: item.imagePath,
                                      company: item.company,
                                      detail: item.detail,
                                      category: "",
                                    ),
                                  );
                                },
                                buttonText: "AI Assistant",
                                onPressed: () {},
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
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
}
