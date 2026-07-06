import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Core/networking/dio_consumer.dart';
import 'package:food_app/Features/home/data/data_source/category_remote_data_source.dart';
import 'package:food_app/Features/home/data/repo/category_repo_impl.dart';
import 'package:food_app/Features/home/domain/use_case/meals_details_use_case.dart';
import 'package:food_app/Features/home/presentation/view_manager/meals_details_cubit/meals_details_cubit.dart';
import 'package:food_app/Features/layout/presentation/view/layout_view.dart';
import 'Core/Utilis/simple_bloc_observer.dart';
import 'Core/networking/supabase_service.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseService.init();
  Bloc.observer = SimpleBlocObserver();
  MealsDetailsCubit(MealsDetailsUseCase(CategoryRepoImpl(baseCategoryRemoteDataSource: 
  CategoryRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())))))..mealsDetailsDate(id: "52772");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food App",
      home: LayoutView(),
    );
  }
}

