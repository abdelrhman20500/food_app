import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Features/favorite/presentation/view_manager/favorite_cubit.dart';
import 'package:food_app/Features/layout/presentation/view/layout_view.dart';
import 'Core/Utilis/simple_bloc_observer.dart';
import 'Core/networking/supabase_service.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseService.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => FavoriteCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food App",
        home: LayoutView(),
      ),
    );
  }
}

