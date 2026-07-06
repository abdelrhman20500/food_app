import 'package:dartz/dartz.dart';
import 'package:food_app/Core/error/failure.dart';
import 'package:food_app/Features/home/data/data_source/category_remote_data_source.dart';
import 'package:food_app/Features/home/data/model/category_meals_model.dart';
import 'package:food_app/Features/home/data/model/category_model.dart';
import 'package:food_app/Features/home/data/model/meals_details_model.dart';
import 'package:food_app/Features/home/domain/repo/category_repo.dart';
import '../../../../Core/error/exceptions.dart';

class CategoryRepoImpl extends CategoryRepo{
  final BaseCategoryRemoteDataSource baseCategoryRemoteDataSource;
  CategoryRepoImpl({required this.baseCategoryRemoteDataSource});

  @override
  Future<Either<Failure, List<CategoryModel>>> categoryData()async{
    try {
      final result= await baseCategoryRemoteDataSource.getCategory();
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? "Server error"),);
    }
  }

  @override
  Future<Either<Failure, List<CategoryMealsModel>>> categoryMealsData({required String category})async{
    try {
      final result= await baseCategoryRemoteDataSource.getCategoryMeals(category: category);
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? "Server error"),);
    }
  }

  @override
  Future<Either<Failure,MealsDetailsModel>> mealsDetailsData({required String id})async{
    try {
      final result= await baseCategoryRemoteDataSource.getMealsDetails(id: id);
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? "Server error"),);
    }
  }
}