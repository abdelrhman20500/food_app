import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Features/home/presentation/view_manager/category_meals_cubit/category_meals_state.dart';
import '../../../domain/use_case/category_meals_use_case.dart';

class CategoryMealsCubit extends Cubit<CategoryMealsState> {
  CategoryMealsCubit(this.categoryMealsUseCase) : super(CategoryMealsInitial());
  final CategoryMealsUseCase categoryMealsUseCase;

  Future<void> categoryMealsDate({required String category}) async {
    emit(CategoryMealsLoading());
    var result = await categoryMealsUseCase.call(category);
    result.fold((e) {
      emit(CategoryMealsFailure(error: e.message));
    }, (model) {
      if (model.isEmpty) {
        emit(CategoryMealsEmpty());
      } else {
        emit(CategoryMealsSuccess(model: model));
      }    });
  }
}