import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  String? hintText;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  TextEditingController? controller;
   bool? obscureText;
  CustomTextFiled(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.controller,
      this.validator,
       this.obscureText
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      obscureText: obscureText!,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
