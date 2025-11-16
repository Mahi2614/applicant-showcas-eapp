// State
import 'package:assetwize/domain/entities/garage_item.dart';
import 'package:assetwize/domain/use_cases/get_garage_item_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageState {
  final List<GarageItem> items;
  final bool isLoading;

  GarageState({required this.items, required this.isLoading});
}

// Cubit
class GarageCubit extends Cubit<GarageState> {
  final GetGarageItemsUseCase getGarageItemsUseCase;

  GarageCubit(this.getGarageItemsUseCase)
    : super(GarageState(items: [], isLoading: true));

  void fetchGarageItems() {
    emit(GarageState(items: [], isLoading: true));
    final items = getGarageItemsUseCase.execute();
    emit(GarageState(items: items, isLoading: false));
  }
}
