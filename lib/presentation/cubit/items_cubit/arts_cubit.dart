// State
import 'package:assetwize/domain/entities/arts_item.dart';
import 'package:assetwize/domain/use_cases/get_arts_item_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtState {
  final List<ArtItem> items;
  final bool isLoading;

  ArtState({required this.items, required this.isLoading});
}

// Cubit
class ArtCubit extends Cubit<ArtState> {
  final GetArtItemsUseCase getArtItemsUseCase;

  ArtCubit(this.getArtItemsUseCase)
    : super(ArtState(items: [], isLoading: true));

  void fetchArtItems() {
    emit(ArtState(items: [], isLoading: true));
    final items = getArtItemsUseCase.execute();
    emit(ArtState(items: items, isLoading: false));
  }
}
