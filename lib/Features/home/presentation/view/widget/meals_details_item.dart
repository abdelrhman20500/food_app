import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Core/constants/app_color.dart';
import 'package:food_app/Core/widgets/custom_bottom.dart';
import 'package:food_app/Features/home/data/model/meals_details_model.dart';
import 'package:food_app/Features/home/presentation/view/widget/build_ingredient_item.dart';
import 'package:food_app/Features/home/presentation/view/widget/info_item.dart';
import 'package:shimmer/shimmer.dart';

class MealsDetailsItem extends StatelessWidget {
  const MealsDetailsItem({super.key, required this.model});

  final MealsDetailsModel model;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: height*0.4,
          pinned: true,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            background:CachedNetworkImage(
              imageUrl: model.meals![0].strMealThumb!,
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
            IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.favorite_border, color: Colors.black),
              ),
              onPressed: () {},
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
                    Chip(label: Text(model.meals![0].strArea!), backgroundColor: const Color(0xFFFFF3E0)),
                    const SizedBox(width: 8),
                    Chip(label: Text(model.meals![0].strCountry!), backgroundColor: const Color(0xFFE3F2FD)),
                  ],
                ),
                const SizedBox(height: 12),
                // Title
                Text(model.meals![0].strMeal!,
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
                const Text("Ingredients", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(height: 12),
                BuildIngredientItem(text: model.meals![0].strIngredient1!),
                BuildIngredientItem(text: model.meals![0].strIngredient2!),
                BuildIngredientItem(text: model.meals![0].strIngredient3!),
                BuildIngredientItem(text: model.meals![0].strIngredient4!),
                BuildIngredientItem(text: model.meals![0].strIngredient5!),
                const SizedBox(height: 30),
                const Text(
                  "Instructions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(model.meals![0].strInstructions!,
                  maxLines: 7,overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 8),
                CustomBottom(text: "Add Favorite", borderRadius: BorderRadius.circular(18.0),
                  onPressed: (){},
                  height: 55,width: double.infinity,backgroundColor: AppColors.primaryColor,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

