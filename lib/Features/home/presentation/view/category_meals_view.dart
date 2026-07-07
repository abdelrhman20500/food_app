import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Core/constants/app_color.dart';
import 'package:food_app/Core/networking/dio_consumer.dart';
import 'package:food_app/Core/theme/app_theme.dart';
import 'package:food_app/Features/home/data/data_source/category_remote_data_source.dart';
import 'package:food_app/Features/home/data/repo/category_repo_impl.dart';
import 'package:food_app/Features/home/domain/use_case/category_meals_use_case.dart';
import 'package:food_app/Features/home/presentation/view/widget/category_meals_grid.dart';
import 'package:food_app/Features/home/presentation/view_manager/category_meals_cubit/category_meals_cubit.dart';
import 'package:food_app/Features/home/presentation/view_manager/category_meals_cubit/category_meals_state.dart';

class CategoryMealsView extends StatelessWidget {
  const CategoryMealsView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()
        {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back),color: AppColors.primaryColor,),
        title: Text("$category Recipes", style: AppTheme.textStyle20,),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => CategoryMealsCubit(CategoryMealsUseCase(
          CategoryRepoImpl(baseCategoryRemoteDataSource:
          CategoryRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())))
        ))..categoryMealsDate(category: category),
        child: BlocBuilder<CategoryMealsCubit, CategoryMealsState>(
            builder: (context, state) {
              if(state is CategoryMealsFailure){
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(state.error, style: const TextStyle(color: Colors.red, fontSize: 16),),
                  ),
                );
              }else if (state is CategoryMealsSuccess) {
                if (state.model.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.no_food, size: 80, color: Colors.grey),
                        SizedBox(height: 16),
                        Text("No recipes found", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      ],
                    ),
                  );
                }
                return CategoryMealsGrid(model: state.model);
              }return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
            },
        ),
      ),
    );
  }
}
