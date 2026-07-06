import 'package:dartz/dartz.dart';
import 'package:food_app/Core/error/failure.dart';
import 'package:food_app/Features/home/data/model/category_meals_model.dart';
import 'package:food_app/Features/home/data/model/category_model.dart';
import 'package:food_app/Features/home/data/model/meals_details_model.dart';

abstract class CategoryRepo{
  Future<Either<Failure, List<CategoryModel>>> categoryData();
  Future<Either<Failure, List<CategoryMealsModel>>> categoryMealsData({required String category});
  Future<Either<Failure, MealsDetailsModel>> mealsDetailsData({required String id});
}