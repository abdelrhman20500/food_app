import 'package:dartz/dartz.dart';
import 'package:food_app/Core/base_use_case/base_use_case.dart';
import 'package:food_app/Core/error/failure.dart';
import 'package:food_app/Features/home/data/model/meals_details_model.dart';
import 'package:food_app/Features/home/domain/repo/category_repo.dart';

class MealsDetailsUseCase extends BaseUseCase<MealsDetailsModel, String>{
  final CategoryRepo categoryRepo;

  MealsDetailsUseCase(this.categoryRepo);
  @override
  Future<Either<Failure,MealsDetailsModel>> call([String? id])async{
    return await categoryRepo.mealsDetailsData(id: id!);
  }
}