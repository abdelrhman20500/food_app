import 'package:dartz/dartz.dart';
import 'package:food_app/Core/base_use_case/base_use_case.dart';
import 'package:food_app/Core/error/failure.dart';
import 'package:food_app/Features/home/data/model/category_model.dart';
import 'package:food_app/Features/home/domain/repo/category_repo.dart';

class CategoryUseCase extends BaseUseCase<List<CategoryModel>, NoParameters>{
  final CategoryRepo categoryRepo;

  CategoryUseCase(this.categoryRepo);
  @override
  Future<Either<Failure, List<CategoryModel>>> call(NoParameters parameters)async{
    return await categoryRepo.categoryData();
  }
}