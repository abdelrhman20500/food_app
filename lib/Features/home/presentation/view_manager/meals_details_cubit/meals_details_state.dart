import 'package:food_app/Features/home/data/model/meals_details_model.dart';

abstract class MealsDetailsState{}
class MealsDetailsInitial extends MealsDetailsState{}
class MealsDetailsLoading extends MealsDetailsState{}
class MealsDetailsFailure extends MealsDetailsState{
  final String error;
  MealsDetailsFailure({required this.error});
}
class MealsDetailsSuccess extends MealsDetailsState{
  final MealsDetailsModel model;
  MealsDetailsSuccess({required this.model});
}
