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
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: meal.strMealThumb ?? "",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(color: Colors.grey),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Text(
                meal.strMeal ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}