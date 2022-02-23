import 'package:flutter/material.dart';
import 'package:my_shop/utils/theme.dart';
import 'package:my_shop/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;


  AuthButton({required this.text, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: mainColor,
        minimumSize: const Size(360,50)
      ),
        onPressed: onPressed,
        child: TextUtils(
          text: text,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ));
  }
}
