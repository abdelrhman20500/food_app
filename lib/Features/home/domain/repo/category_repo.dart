import 'package:dartz/dartz.dart';
import 'package:food_app/Core/error/failure.dart';
import 'package:food_app/Features/home/data/model/category_model.dart';

abstract class CategoryRepo{
  Future<Either<Failure, List<CategoryModel>>> categoryData();
}