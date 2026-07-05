import 'package:food_app/Features/home/data/model/category_meals_model.dart';


abstract class CategoryMealsState {}

class CategoryMealsInitial extends CategoryMealsState {}
class CategoryMealsLoading extends CategoryMealsState {}
class CategoryMealsEmpty extends CategoryMealsState {}
class CategoryMealsFailure extends CategoryMealsState {
  final String error;
  CategoryMealsFailure({required this.error});
}
class CategoryMealsSuccess extends CategoryMealsState {
  final List<CategoryMealsModel> model;
  CategoryMealsSuccess({required this.model});
}
