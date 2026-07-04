import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, this.keyboardType,
    this.suffixIcon,this.controller, this.prefixIcon,});

  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: (value){
        if(value == null || value.isEmpty){
          return "This Field is Required";
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0,),
            borderSide: const BorderSide(color: Colors.grey)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.0,),
              borderSide: const BorderSide(color: Colors.grey)
          ),
          hintText: hintText,
          hintStyle: AppTheme.textStyle16.copyWith(fontSize: 18),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        prefixIconColor: Colors.grey,
      ),
    );
  }
}
