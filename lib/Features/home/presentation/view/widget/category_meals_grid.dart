import 'package:flutter/material.dart';
import 'package:food_app/Features/home/data/model/category_meals_model.dart';
import 'package:food_app/Features/home/presentation/view/widget/category_meals_card.dart';

class CategoryMealsGrid extends StatelessWidget {
  const CategoryMealsGrid({super.key, required this.model});

  final List<CategoryMealsModel> model;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // تحديد childAspectRatio ديناميكي حسب عرض الشاشة
    double childAspectRatio = screenWidth < 400 ? 2.4 / 4.0 : 2.8 / 4.0;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: screenWidth < 380 ? 8.0 : 12.0,
        mainAxisSpacing: screenWidth < 380 ? 8.0 : 12.0,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: model.length,
      itemBuilder: (context, index) {
        return CategoryMealsCard(
          imageUrl: model[index].strMealThumb ?? '',
          title: model[index].strMeal ?? '',
          country: model[index].strCountry ?? '',
          id: model[index].idMeal ?? '',
        );
      },
    );
  }
}