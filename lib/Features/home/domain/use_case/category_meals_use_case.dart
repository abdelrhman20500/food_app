import 'package:dartz/dartz.dart';
import 'package:food_app/Core/base_use_case/base_use_case.dart';
import 'package:food_app/Core/error/failure.dart';
import 'package:food_app/Features/home/data/model/category_meals_model.dart';
import 'package:food_app/Features/home/domain/repo/category_repo.dart';

class CategoryMealsUseCase extends BaseUseCase<List<CategoryMealsModel>, String>{
  final CategoryRepo categoryRepo;

  CategoryMealsUseCase(this.categoryRepo);
  @override
  Future<Either<Failure, List<CategoryMealsModel>>> call([String? category])async{
    return await categoryRepo.categoryMealsData(category: category!);
  }
}