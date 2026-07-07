// // lib/Core/helpers/favorites_helper.dart
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
//
// class FavoritesHelper {
//   static const String _key = 'favorite_meals';
//
//   // Add to favorites
//   static Future<void> addToFavorites(Map<String, dynamic> meal) async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> favorites = prefs.getStringList(_key) ?? [];
//
//     String mealJson = jsonEncode(meal);
//
//     if (!favorites.contains(mealJson)) {
//       favorites.add(mealJson);
//       await prefs.setStringList(_key, favorites);
//     }
//   }
//
//   // Remove from favorites
//   static Future<void> removeFromFavorites(String idMeal) async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> favorites = prefs.getStringList(_key) ?? [];
//
//     favorites.removeWhere((item) {
//       final decoded = jsonDecode(item);
//       return decoded['idMeal'] == idMeal;
//     });
//
//     await prefs.setStringList(_key, favorites);
//   }
//
//   // Get all favorites
//   static Future<List<Map<String, dynamic>>> getFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> favorites = prefs.getStringList(_key) ?? [];
//
//     return favorites.map((item) => Map<String, dynamic>.from(jsonDecode(item))).toList();
//   }
//
//   // Check if favorite
//   static Future<bool> isFavorite(String idMeal) async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> favorites = prefs.getStringList(_key) ?? [];
//
//     return favorites.any((item) {
//       final decoded = jsonDecode(item);
//       return decoded['idMeal'] == idMeal;
//     });
//   }
// }