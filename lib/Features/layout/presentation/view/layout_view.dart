import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Features/favorite/presentation/view/favorite_view.dart';
import '../../../../Core/constants/app_color.dart';
import '../../../home/presentation/view/home_view.dart';
import '../../../profile/presentation/view/profile_view.dart';
import '../view_manager/nav_bar_cubit.dart';
import '../view_manager/nav_bar_state.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});
  static const String routeName ="LayoutScreen";

  @override
  State<LayoutView> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutView> {
  final List<Widget> tabs=[
    const HomeView(),
    const FavoriteView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<NavBarCubit>(context);
          return Scaffold(
            body: SafeArea(
                child: tabs[cubit.currentIndex]),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22)
              ),
              child: BottomNavigationBar(
                  backgroundColor:AppColors.whiteColor ,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.primaryColor,
                  unselectedItemColor: Colors.grey,
                  selectedIconTheme: const IconThemeData(size: 25),
                  unselectedIconTheme: const IconThemeData(size: 25),
                  selectedLabelStyle: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500,),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500),
                  currentIndex: cubit.currentIndex,
                  onTap: (index){
                    setState(() {
                      cubit.currentIndex =index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
                    BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorite"),
                    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
