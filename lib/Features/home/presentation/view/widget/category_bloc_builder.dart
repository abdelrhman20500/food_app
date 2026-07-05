import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Core/functions/snack_bar_message.dart';
import 'package:food_app/Core/networking/dio_consumer.dart';
import 'package:food_app/Features/home/data/data_source/category_remote_data_source.dart';
import 'package:food_app/Features/home/data/repo/category_repo_impl.dart';
import 'package:food_app/Features/home/domain/use_case/category_use_case.dart';
import 'package:food_app/Features/home/presentation/view_manager/category_cubit/category_cubit.dart';
import '../../view_manager/category_cubit/category_state.dart';
import 'category_grid_view.dart';

class CategoryBlocBuilder extends StatelessWidget {
  const CategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(
        CategoryUseCase(
          CategoryRepoImpl(
            baseCategoryRemoteDataSource: CategoryRemoteDataSource(
              apiConsumer: DioConsumer(dio: Dio()),
            ),
          ),
        ),
      )..categoryDate(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator(),),);
          } else if (state is CategoryFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              snackBarMessage(context: context, text: state.errMessage, backgroundColor: Colors.red,);});
            return SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    state.errMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              ),
            );
          } else if (state is CategorySuccess) {
            return CategoryGridView(model: state.categoryModel);
          }

          // Default state
          return const SliverToBoxAdapter(
            child: Center(
              child:SizedBox()
            ),
          );
        },
      ),
    );
  }
}