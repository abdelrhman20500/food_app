import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:food_app/Features/home/data/model/meals_details_model.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial()) {
    getFavorites();
  }

  Future<void> getFavorites() async {
    emit(FavoriteLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = Supabase.instance.client.auth.currentUser?.id;
      final key = "favorite_meals_json_${userId ?? 'guest'}";
      final favoritesJson = prefs.getStringList(key) ?? [];
      final List<Meals> favorites = favoritesJson.map((item) {
        return Meals.fromJson(jsonDecode(item) as Map<String, dynamic>);
      }).toList();
      emit(FavoriteSuccess(favorites));
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
    }
  }

  Future<void> toggleFavorite(Meals meal) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = Supabase.instance.client.auth.currentUser?.id;
      final key = "favorite_meals_json_${userId ?? 'guest'}";
      final favoritesJson = prefs.getStringList(key) ?? [];
      
      final List<Meals> favorites = favoritesJson.map((item) {
        return Meals.fromJson(jsonDecode(item) as Map<String, dynamic>);
      }).toList();

      final index = favorites.indexWhere((element) => element.idMeal == meal.idMeal);

      if (index != -1) {
        favorites.removeAt(index);
      } else {
        favorites.add(meal);
      }

      final updatedJsonList = favorites.map((e) => jsonEncode(e.toJson())).toList();
      await prefs.setStringList(key, updatedJsonList);
      emit(FavoriteSuccess(favorites));
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
    }
  }
}
