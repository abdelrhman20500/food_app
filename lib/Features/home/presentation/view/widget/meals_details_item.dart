import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_app/Features/home/data/model/meals_details_model.dart';
import 'package:food_app/Features/home/presentation/view/widget/build_ingredient_item.dart';
import 'package:food_app/Features/home/presentation/view/widget/info_item.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../favorite/presentation/view_manager/favorite_cubit.dart';
import '../../../../favorite/presentation/view_manager/favorite_state.dart';

class MealsDetailsItem extends StatelessWidget {
  const MealsDetailsItem({super.key, required this.model});

  final MealsDetailsModel model;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    
    if (model.meals == null || model.meals!.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Meal Details'),
        ),
        body: const Center(
          child: Text('No meal details found.'),
        ),
      );
    }
    
    final meal = model.meals![0];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height * 0.4,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: meal.strMealThumb != null && meal.strMealThumb!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: meal.strMealThumb!,
                      fit: BoxFit.cover,
                      height: height * 0.25,
                      width: double.infinity,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[700]!,
                        highlightColor: Colors.grey[500]!,
                        child: Container(
                          height: height * 0.25,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    )
                  : Container(
                      height: height * 0.25,
                      width: double.infinity,
                      color: Colors.grey,
                      child: const Icon(Icons.fastfood, size: 50, color: Colors.white54),
                    ),
            ),
            leading: IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  List<Meals> favorites = [];
                  if (state is FavoriteSuccess) {
                    favorites = state.favorites;
                  }
                  final mealId = meal.idMeal ?? '';
                  final isFav = favorites.any((m) => m.idMeal == mealId);
                  return IconButton(
                    icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : Colors.black,
                      ),
                    ),
                    onPressed: () {
                      context.read<FavoriteCubit>().toggleFavorite(meal);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isFav ? "Removed from favorites" : "Added to favorites",
                          ),
                          backgroundColor: isFav ? Colors.red : Colors.green,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (meal.strArea != null && meal.strArea!.trim().isNotEmpty) ...[
                        Chip(
                          label: Text(meal.strArea!), 
                          backgroundColor: const Color(0xFFFFF3E0),
                        ),
                        const SizedBox(width: 8),
                      ],
                      if (meal.strCountry != null && meal.strCountry!.trim().isNotEmpty)
                        Chip(
                          label: Text(meal.strCountry!), 
                          backgroundColor: const Color(0xFFE3F2FD),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Title
                  Text(
                    meal.strMeal ?? '',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoItem(icon: Icons.access_time, text: "25 mins"),
                      InfoItem(icon: Icons.whatshot, text: "Medium"),
                      InfoItem(icon: Icons.local_fire_department, text: "450 kcal"),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Ingredients
                  const Text(
                    "Ingredients", 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ..._getIngredients(meal).map((ingredient) => BuildIngredientItem(text: ingredient)),
                  const SizedBox(height: 30),
                  const Text(
                    "Instructions",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    meal.strInstructions ?? '',
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getIngredients(Meals meal) {
    final List<dynamic> rawIngredients = [
      meal.strIngredient1,
      meal.strIngredient2,
      meal.strIngredient3,
      meal.strIngredient4,
      meal.strIngredient5,
      meal.strIngredient6,
      meal.strIngredient7,
      meal.strIngredient8,
      meal.strIngredient9,
      meal.strIngredient10,
      meal.strIngredient11,
      meal.strIngredient12,
      meal.strIngredient13,
      meal.strIngredient14,
      meal.strIngredient15,
      meal.strIngredient16,
      meal.strIngredient17,
      meal.strIngredient18,
      meal.strIngredient19,
      meal.strIngredient20,
    ];
    
    final List<String> ingredients = [];
    for (var item in rawIngredients) {
      if (item != null) {
        final str = item.toString().trim();
        if (str.isNotEmpty) {
          ingredients.add(str);
        }
      }
    }
    return ingredients;
  }
}

