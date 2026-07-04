import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Core/constants/app_images.dart';
import 'package:food_app/Core/theme/app_theme.dart';
import 'package:food_app/Core/widgets/custom_bottom.dart';
import 'package:food_app/Core/widgets/custom_text_form_field.dart';
import 'package:food_app/Features/auth/data/repo/auth_repo.dart';
import 'package:food_app/Features/auth/presentation/view/sign_up_view.dart';
import 'package:food_app/Features/auth/presentation/view_manager/auth_cubit.dart';
import 'package:food_app/Features/auth/presentation/view_manager/auth_states.dart';
import '../../../../Core/constants/app_color.dart';
import '../../../../Core/functions/snack_bar_message.dart';
import '../../../../Core/widgets/social_button.dart';
import '../../../layout/presentation/view/layout_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is LoginFailure){
            snackBarMessage(context: context, text: state.error,backgroundColor: Colors.red);
          }else if(state is LoginSuccess){
            snackBarMessage(context: context,backgroundColor: Colors.green, text: "Login Success");
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
                        SizedBox(height: height*0.04,),
                        Container(
                          height: height * 0.25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            image: const DecorationImage(image: AssetImage(AppImages.image),fit: BoxFit.cover,),),
                        ),
                        SizedBox(height: height*0.01,),
                        const Text("Welcome Back", style: AppTheme.textStyle30),
                        const Text("Sign in to continue your culinary journey", style: AppTheme.textStyle16,),
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
                        state is LoginLoading ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)) :
                        CustomBottom(text: "Login",height: height*0.07,width: double.infinity,
                          borderRadius: BorderRadius.circular(16),
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              BlocProvider.of<AuthCubit>(context).signIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim()
                              );
                            }
                          },),
                        SizedBox(height: height*0.03,),
                        const Align(
                            alignment: Alignment.center,
                            child: Text("Or Continue With", style: AppTheme.textStyle17,)),
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
                            const Text("Don't have an account ?",style: AppTheme.textStyle18,),
                            SizedBox(width: width*0.02,),
                            InkWell(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                      builder:(context)=> SignUpView()));
                                },
                                child: Text("SignUp", style:AppTheme.textStyle20.copyWith(color: AppColors.primaryColor) ,)),
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
    );
  }
}
