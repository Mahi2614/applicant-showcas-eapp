// State
import 'package:assetwize/domain/entities/insurance_item.dart';
import 'package:assetwize/domain/use_cases/get_insurance_item_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsuranceState {
  final List<InsuranceItem> items;
  final bool isLoading;

  InsuranceState({required this.items, required this.isLoading});
}

//cubit
class InsuranceCubit extends Cubit<InsuranceState> {
  final GetInsuranceItemsUseCase useCase;

  InsuranceCubit(this.useCase)
    : super(InsuranceState(items: [], isLoading: true));

  Future<void> fetchInsuranceItems() async {
    emit(InsuranceState(items: [], isLoading: true));

    final items = await useCase.execute();

    emit(InsuranceState(items: items, isLoading: false));
  }
}
