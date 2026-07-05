import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Core/constants/app_color.dart';
import 'package:shimmer/shimmer.dart';

class CategoryMealsCard extends StatelessWidget {
  const CategoryMealsCard({super.key,required this.title,required this.imageUrl, required this.country});

  final String imageUrl;
  final String title;
  final String country;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                height: height * 0.24,
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.bold,),
                    maxLines: 1,overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_city, size: 16, color: AppColors.primaryColor),
                      const SizedBox(width: 8.0),
                      Text(country, style: const TextStyle(fontSize: 14, color: AppColors.primaryColor),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}