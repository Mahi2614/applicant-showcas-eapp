// State
import 'package:assetwize/domain/entities/realty_items.dart';
import 'package:assetwize/domain/use_cases/get_realty_item_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RealtyState {
  final List<RealtyItem> items;
  final bool isLoading;

  RealtyState({required this.items, required this.isLoading});
}

// Cubit
class RealtyCubit extends Cubit<RealtyState> {
  final GetRealtyItemsUseCase getRealtyItemsUseCase;

  RealtyCubit(this.getRealtyItemsUseCase)
    : super(RealtyState(items: [], isLoading: true));

  void fetchRealtyItems() {
    emit(RealtyState(items: [], isLoading: true));
    final items = getRealtyItemsUseCase.execute();
    emit(RealtyState(items: items, isLoading: false));
  }
}
