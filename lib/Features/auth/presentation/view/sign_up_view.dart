import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Core/constants/app_images.dart';
import 'package:food_app/Core/theme/app_theme.dart';
import 'package:food_app/Core/widgets/custom_bottom.dart';
import 'package:food_app/Core/widgets/custom_text_form_field.dart';
import 'package:food_app/Features/auth/data/repo/auth_repo.dart';
import 'package:food_app/Features/auth/presentation/view/login_view.dart';
import 'package:food_app/Features/auth/presentation/view_manager/auth_cubit.dart';
import 'package:food_app/Features/auth/presentation/view_manager/auth_states.dart';
import 'package:food_app/Features/layout/presentation/view/layout_view.dart';
import '../../../../Core/constants/app_color.dart';
import '../../../../Core/functions/snack_bar_message.dart';
import '../../../../Core/widgets/social_button.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocProvider(
        create: (context) => AuthCubit(AuthRepo()),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is SignUpFailure){
              print(state.error);
              snackBarMessage(context: context, text: state.error,backgroundColor: Colors.red);
            }else if(state is SignUpSuccess){
              snackBarMessage(context: context, text: "SignUp Success", backgroundColor: Colors.green);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
              const LayoutView()));
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: (){
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: height*0.05,),
                          CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              radius: 40,
                              child: Image.asset(AppImages.iconLogo,height: height*0.05,width: width*0.2,fit: BoxFit.contain,)),
                          const Align(
                              alignment: Alignment.center,
                              child: Text("Create Account", style: AppTheme.textStyle30)),
                          const Align(
                              alignment: Alignment.center,
                              child: Text("Join our community of food lovers", style: AppTheme.textStyle16,)),
                          SizedBox(height: height*0.02,),
                          const Text("Full Name",style: AppTheme.textStyle20,),
                          SizedBox(height: height*0.01,),
                          CustomTextFormField(
                            controller: nameController,keyboardType: TextInputType.text,
                            hintText: "Full Name", prefixIcon: const Icon(Icons.person),),
                          SizedBox(height: height*0.02,),
                          const Text("Email",style: AppTheme.textStyle20,),
                          SizedBox(height: height*0.01,),
                          CustomTextFormField(
                            controller: emailController,keyboardType: TextInputType.emailAddress,
                            hintText: "Email", prefixIcon: const Icon(Icons.email_outlined),),
                          SizedBox(height: height*0.02,),
                          const Text("Password",style: AppTheme.textStyle20,),
                          SizedBox(height: height*0.01,),
                          CustomTextFormField(
                            controller: passwordController,keyboardType: TextInputType.text,
                            hintText: "Password", prefixIcon: const Icon(Icons.lock_open_outlined),suffixIcon: const Icon(Icons.remove_red_eye),),
                          SizedBox(height: height*0.04,),
                          state is SignUpLoading ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
                              :CustomBottom(text: "SignUp",height: height*0.07,width: double.infinity,
                            borderRadius: BorderRadius.circular(16),
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                BlocProvider.of<AuthCubit>(context).signUp(
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim()
                                );
                              }
                            },),
                          SizedBox(height: height*0.03,),
                          const Align(
                              alignment: Alignment.center,
                              child: Text("Or SignUp With", style: AppTheme.textStyle17,)),
                          SizedBox(height: height*0.03,),
                          Row(
                            children: [
                              Expanded(
                                child: SocialButton( label: 'Google',
                                  onPressed: () {},),),
                              const SizedBox(width: 16),
                              Expanded(
                                child: SocialButton( label: 'Apple',
                                  onPressed: () {},),),
                            ],
                          ),
                          SizedBox(height: height*0.03,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account ?",style: AppTheme.textStyle18,),
                              SizedBox(width: width*0.02,),
                              InkWell(
                                  onTap: (){
                                    Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder:(context)=> LoginView()));
                                  },
                                  child: Text("Login", style:AppTheme.textStyle20.copyWith(color: AppColors.primaryColor) ,)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
