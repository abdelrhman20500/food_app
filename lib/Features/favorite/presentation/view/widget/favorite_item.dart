import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Features/favorite/presentation/view_manager/favorite_cubit.dart';
import 'package:food_app/Features/home/data/model/meals_details_model.dart';
import 'package:food_app/Features/home/presentation/view/meals_details_view.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.meal});

  final Meals meal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (meal.idMeal != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealsDetailsView(id: meal.idMeal!),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22.0),
              child: CachedNetworkImage(
                imageUrl: meal.strMealThumb ?? "",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: Container(color: Colors.grey),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),

            // Gradient Overlay (نفس CategoryCard)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.75),
                    ],
                    stops: const [0.4, 0.7, 1.0],
                  ),
                ),
              ),
            ),

            // Heart Icon
            Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                onTap: () {
                  context.read<FavoriteCubit>().toggleFavorite(meal);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Removed from favorites"),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite, color: Colors.red, size: 20),
                ),
              ),
            ),

            // Title at Bottom
            Positioned(
              left: 18,
              bottom: 18,
              right: 18,
              child: Text(
                meal.strMeal ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 3,
                      color: Colors.black87,
                    ),
                  ],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}