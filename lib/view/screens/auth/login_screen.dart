import 'package:flutter/material.dart';
import 'package:my_shop/logic/controllers/auth_controller.dart';
import 'package:my_shop/routes/routes.dart';
import 'package:my_shop/utils/my_string.dart';
import 'package:my_shop/utils/theme.dart';
import 'package:my_shop/view/widgets/auth_button.dart';
import 'package:my_shop/view/widgets/auth_text_form_field.dart';
import 'package:my_shop/view/widgets/buttom_container.dart';
import 'package:my_shop/view/widgets/text_utils.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);



  final formKey = GlobalKey<FormState>();

 final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller =  Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 40,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: "LOG",
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: mainColor,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: "IN",
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),

                        ///------------------email
                        AuthTextFormField(
                          controller: emailController,
                          validator: (value) {
                            if(value.toString().length <= 2
                                || !RegExp(validationEmail).hasMatch(value)
                            ){
                              return "Enter Valid Email";
                            }else{
                              return null;
                            }

                          },
                          obscureText: false,
                          prefixIcon: Image.asset("assets/images/email.png"),
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        ///------------------Password
                        GetBuilder<AuthController>(builder: (_){

                          return AuthTextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if(value.toString().length < 6)
                              {
                                return "Password should be longer or equal 6 characters";
                              }else{
                                return null;
                              }
                            },
                            obscureText:
                            controller.isVisibility ? false : true,
                            prefixIcon: Image.asset("assets/images/lock.png"),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                                onPressed: (){
                                  controller.visibility();
                                },
                                icon: controller.isVisibility ?
                                const Icon(Icons.visibility,
                                  color: Colors.black,)
                                    :const Icon(Icons.visibility_off,
                                  color: Colors.black,)
                            ),
                          );

                        }),

                       Align(
                         alignment: Alignment.centerRight,
                         child:  TextButton(onPressed: (){},
                             child: TextUtils(
                               text: "Forget Password ?",
                               color: Colors.black,
                               fontSize: 16, fontWeight: FontWeight.normal,
                             )),
                       ),

                        const SizedBox(
                          height: 20,
                        ),

                        AuthButton(
                          text: 'LOG IN'.toUpperCase(),
                          onPressed: () {},
                        ),


                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextUtils(
                            text: "OR",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          InkWell(
                            onTap: (){},
                            child:
                            Image.asset("assets/images/facebook.png"),
                          ),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: (){},
                            child:
                            Image.asset("assets/images/google.png"),
                          ),
                        ],),
                      ],
                    ),
                  ),
                ),
              ),
              BottomContainer(
                fText: "Don't have an Account? ",
                sText: 'Sign up',
                onPressed: () {
                  Get.offNamed(Routes.signupScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
