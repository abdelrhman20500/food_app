import 'package:flutter/material.dart';
import 'package:food_app/Features/home/data/model/category_meals_model.dart';
import 'package:food_app/Features/home/presentation/view/widget/category_meals_card.dart';

class CategoryMealsGrid extends StatelessWidget {
  const CategoryMealsGrid({super.key, required this.model});

  final List<CategoryMealsModel> model;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2.6/4.0,
      ),
      itemCount: model.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: CategoryMealsCard(
            imageUrl:model[index].strMealThumb!,
            title: model[index].strMeal!,
            country: model[index].strCountry!,
          ),
        );
      },
    );
  }
}