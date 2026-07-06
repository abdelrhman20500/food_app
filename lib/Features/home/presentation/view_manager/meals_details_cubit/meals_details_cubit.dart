import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Features/home/domain/use_case/meals_details_use_case.dart';
import 'package:food_app/Features/home/presentation/view_manager/meals_details_cubit/meals_details_state.dart';

class MealsDetailsCubit extends Cubit<MealsDetailsState> {
  MealsDetailsCubit(this.mealsDetailsUseCase) : super(MealsDetailsInitial());
  final MealsDetailsUseCase mealsDetailsUseCase;

  Future<void> mealsDetailsDate({required String id}) async {
    emit(MealsDetailsLoading());
    var result = await mealsDetailsUseCase.call(id);
    result.fold((e) {
      emit(MealsDetailsFailure(error: e.message));
    }, (model) {
        emit(MealsDetailsSuccess(model: model));
      });
  }
}