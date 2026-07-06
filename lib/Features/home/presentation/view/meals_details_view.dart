import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Core/constants/app_color.dart';
import 'package:food_app/Core/functions/snack_bar_message.dart';
import 'package:food_app/Core/networking/dio_consumer.dart';
import 'package:food_app/Features/home/data/data_source/category_remote_data_source.dart';
import 'package:food_app/Features/home/data/repo/category_repo_impl.dart';
import 'package:food_app/Features/home/domain/use_case/meals_details_use_case.dart';
import 'package:food_app/Features/home/presentation/view/widget/meals_details_item.dart';
import 'package:food_app/Features/home/presentation/view_manager/meals_details_cubit/meals_details_cubit.dart';
import 'package:food_app/Features/home/presentation/view_manager/meals_details_cubit/meals_details_state.dart';

class MealsDetailsView extends StatelessWidget {
  const MealsDetailsView({super.key, required this.id});

  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MealsDetailsCubit(MealsDetailsUseCase(
            CategoryRepoImpl(baseCategoryRemoteDataSource: CategoryRemoteDataSource(apiConsumer:
            DioConsumer(dio: Dio())))))..mealsDetailsDate(id: id.toString()),
        child: BlocBuilder<MealsDetailsCubit, MealsDetailsState>(
          builder: (context, state) {
            if(state is MealsDetailsFailure){
              snackBarMessage(context: context, text: state.error);
            } else if(state is MealsDetailsSuccess){
              return MealsDetailsItem(model: state.model);
            }
            return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
          },
        ),
      ),
    );
  }
}
