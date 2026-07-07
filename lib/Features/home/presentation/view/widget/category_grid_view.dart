import 'package:flutter/material.dart';
import 'package:food_app/Features/home/data/model/category_model.dart';
import 'category_card.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key, required this.model});

  final List<CategoryModel> model;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.8 / 2.0,
      ),
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return CategoryCard(
            imageUrl: model[index].strCategoryThumb ?? '',
            title: model[index].strCategory ?? '',
          );
        },
        childCount: model.length,
      ),
    );
  }
}