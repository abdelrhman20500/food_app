import 'package:flutter/material.dart';
import 'package:food_app/Core/constants/app_color.dart';
import 'package:food_app/Core/theme/app_theme.dart';
import 'package:food_app/Features/home/presentation/view/widget/category_bloc_builder.dart';
import 'package:food_app/Features/home/presentation/view/widget/home_search.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: const Text("Recipe Finder", style: AppTheme.textStyle20,),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active_outlined, color: AppColors.primaryColor,))
        ],
      ),
      body:CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: HomeSearch(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Categories", style: AppTheme.textStyle22),
                  Text("See all", style: AppTheme.textStyle17.copyWith(color: AppColors.primaryColor,),),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: height*0.01,),),
          const CategoryBlocBuilder(),
        ],
      )
    );
  }
}
