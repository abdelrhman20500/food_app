import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Core/theme/app_theme.dart';
import 'package:food_app/Core/constants/app_color.dart';
import 'package:food_app/Features/favorite/presentation/view/widget/favorite_item.dart';
import 'package:food_app/Features/favorite/presentation/view_manager/favorite_cubit.dart';
import 'package:food_app/Features/favorite/presentation/view_manager/favorite_state.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "My Favorites",
            style: AppTheme.textStyle22,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primaryColor),
                );
              } else if (state is FavoriteFailure) {
                return Center(
                  child: Text(
                    "Error: ${state.error}",
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else if (state is FavoriteSuccess) {
                final favorites = state.favorites;
                if (favorites.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          "No favorites added yet!",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return FavoriteItem(meal: favorites[index]);
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}