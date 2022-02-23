import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/logic/controllers/auth_controller.dart';
import 'package:my_shop/view/widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {

  final controller  = Get.find<AuthController>();

   CheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){

      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ?
              Image.asset("assets/images/check.png")
                  :
              Container()
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                text: "i accept ",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              TextUtils(
                text: " terms & conditions",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                underLine: TextDecoration.underline,
              ),
            ],
          )
        ],
      );


    });
  }
}
