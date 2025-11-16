// State
import 'package:assetwize/domain/entities/collectible_item.dart';
import 'package:assetwize/domain/use_cases/get_collectible_item_useecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectibleState {
  final List<CollectibleItem> items;
  final bool isLoading;

  CollectibleState({required this.items, required this.isLoading});
}

// Cubit
class CollectibleCubit extends Cubit<CollectibleState> {
  final GetCollectibleItemsUseCase getCollectibleItemsUseCase;

  CollectibleCubit(this.getCollectibleItemsUseCase)
    : super(CollectibleState(items: [], isLoading: true));

  void fetchCollectibleItems() {
    emit(CollectibleState(items: [], isLoading: true));
    final items = getCollectibleItemsUseCase.execute();
    emit(CollectibleState(items: items, isLoading: false));
  }
}
