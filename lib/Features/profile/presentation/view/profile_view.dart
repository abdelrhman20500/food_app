import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Core/theme/app_theme.dart';
import 'package:food_app/Features/profile/presentation/view/widget/build_list_title.dart';
import 'package:food_app/Features/profile/presentation/view/widget/build_section_title.dart';
import 'package:food_app/Features/profile/presentation/view/widget/build_switch_title.dart';
import 'package:food_app/Features/profile/presentation/view_manager/profile_cubit.dart';
import 'package:food_app/Features/profile/presentation/view_manager/profile_state.dart';
import '../../../../Core/Routing/routes.dart';
import '../../../../Core/constants/app_color.dart';
import '../../../../Core/functions/snack_bar_message.dart';
import '../../data/repo/profile_repo.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileRepo())..getUserData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSignOutSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, Routes.loginView, (route) => false);
          }
          if (state is ProfileSignOutFailure) {
            snackBarMessage(context: context, text: "Logout Failed: ${state.error}");
          }
          if (state is ProfileFailure) {
            snackBarMessage(context: context, text: "Failed to load profile: ${state.error}");
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading || state is ProfileSignOutLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.deepPurple));
          }
          if(state is ProfileSuccess){
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Profile Picture
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 58,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 54,
                            backgroundColor: Colors.grey[200],
                            child: ClipOval(
                              child: Image.asset("assets/images/person.jpg",
                                width: 106, height: 106, fit: BoxFit.fill,),
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.camera_alt, size: 18, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(state.userModel.name,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(state.userModel.email,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  const SizedBox(height: 30),

                  // ACCOUNT Section
                  const BuildSectionTitle(title: "ACCOUNT"),
                  const BuildListTitle(icon: Icons.person_outline, title: "Edit Profile"),
                  const BuildListTitle(icon: Icons.lock_outline,title: "Change Password"),
                  const BuildListTitle(icon: Icons.notifications_outlined,title: "Notification Settings"),

                  const SizedBox(height: 20),

                  // PREFERENCES Section
                  const BuildSectionTitle(title: "PREFERENCES"),
                  const BuildSwitchTile(icon: Icons.dark_mode_outlined,title: "Dark Mode",value: true),
                  const BuildListTitle(icon: Icons.language, title: "Language", trailing: Text("English", style: TextStyle(color: Colors.orange))),

                  const SizedBox(height: 20),

                  // SUPPORT Section
                  const BuildSectionTitle(title: "SUPPORT"),
                  const BuildListTitle(icon: Icons.help_outline,title:  "Help Center"),
                  const BuildListTitle(icon: Icons.privacy_tip_outlined,title: "Privacy Policy"),
                  const BuildListTitle(icon: Icons.description_outlined,title: "Terms of Service"),

                  const SizedBox(height: 40),

                  // Logout Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        showLogoutDialog(context, context.read<ProfileCubit>());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFF0F0),
                        foregroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout),
                          SizedBox(width: 8),
                          Text("Logout", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
  void showLogoutDialog(BuildContext context, ProfileCubit cubit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Logout", style: AppTheme.textStyle20.copyWith(color: AppColors.primaryColor),),
        content: const Text("Are you sure you want to logout?", style: TextStyle(color: AppColors.primaryColor),),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel",style: AppTheme.textStyle18,),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              cubit.signOut();
            },
            child: const Text("Logout", style: TextStyle(fontSize: 18, color: Colors.red)),
          ),
        ],
      ),
    );
  }
}