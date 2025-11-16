import 'package:assetwize/domain/entities/jewellery_item.dart';
import 'package:assetwize/domain/use_cases/get_jewellery_item_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// State
class JewelleryState {
  final List<JewelleryItem> items;
  final bool isLoading;

  JewelleryState({required this.items, required this.isLoading});
}

// Cubit
class JewelleryCubit extends Cubit<JewelleryState> {
  final GetJewelleryItemsUseCase getJewelleryItemsUseCase;

  JewelleryCubit(this.getJewelleryItemsUseCase)
    : super(JewelleryState(items: [], isLoading: true));

  void fetchJewelleryItems() {
    emit(JewelleryState(items: [], isLoading: true));
    final items = getJewelleryItemsUseCase.execute();
    emit(JewelleryState(items: items, isLoading: false));
  }
}
