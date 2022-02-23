import 'package:flutter/material.dart';
import 'package:my_shop/utils/theme.dart';
import 'package:my_shop/view/widgets/text_utils.dart';

class BottomContainer extends StatelessWidget {
  
  final String fText;
  final String sText;
  final VoidCallback onPressed;
   const BottomContainer({ required this.fText, required this.sText, required this.onPressed}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(text: fText,
              fontSize: 20,
              fontWeight: FontWeight.normal, 
              color: Colors.white),
          TextButton(onPressed:onPressed,
            child:
          TextUtils(text: sText,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white), )
        ],
      ),
    );
  }
}
