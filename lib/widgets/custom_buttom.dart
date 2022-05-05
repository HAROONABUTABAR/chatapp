import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String textButtom;
  void Function()? onTap;

  CustomButtom({Key? key, required this.textButtom , this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(textButtom),
        ),
      ),
    );
  }
}
