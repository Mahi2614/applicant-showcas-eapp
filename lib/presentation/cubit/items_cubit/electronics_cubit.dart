// State
import 'package:assetwize/domain/entities/electronics_item.dart';
import 'package:assetwize/domain/use_cases/get_electronics_item_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElectronicsState {
  final List<ElectronicsItem> items;
  final bool isLoading;

  ElectronicsState({required this.items, required this.isLoading});
}

// Cubit
class ElectronicsCubit extends Cubit<ElectronicsState> {
  final GetElectronicsItemsUseCase getElectronicsItemsUseCase;

  ElectronicsCubit(this.getElectronicsItemsUseCase)
    : super(ElectronicsState(items: [], isLoading: true));

  void fetchElectronicsItems() {
    emit(ElectronicsState(items: [], isLoading: true));
    final items = getElectronicsItemsUseCase.execute();
    emit(ElectronicsState(items: items, isLoading: false));
  }
}
