import 'package:food_app/Features/home/data/model/meals_details_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
class FavoriteLoading extends FavoriteState {}
class FavoriteSuccess extends FavoriteState {
  final List<Meals> favorites;
  FavoriteSuccess(this.favorites);
}
class FavoriteFailure extends FavoriteState {
  final String error;
  FavoriteFailure(this.error);
}
