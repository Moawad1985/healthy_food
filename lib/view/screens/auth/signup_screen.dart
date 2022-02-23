import 'package:flutter/material.dart';
import 'package:my_shop/logic/controllers/auth_controller.dart';
import 'package:my_shop/routes/routes.dart';
import 'package:my_shop/utils/my_string.dart';
import 'package:my_shop/utils/theme.dart';
import 'package:my_shop/view/widgets/auth_button.dart';
import 'package:my_shop/view/widgets/auth_text_form_field.dart';
import 'package:my_shop/view/widgets/buttom_container.dart';
import 'package:my_shop/view/widgets/check_widget.dart';
import 'package:my_shop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
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
                              text: "SIGN",
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: mainColor,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: "UP",
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        AuthTextFormField(
                          controller: nameController,
                          validator: (value) {
                            if(value.toString().length <= 2
                            || !RegExp(validationName).hasMatch(value)
                            ){
                              return "Enter Valid Name";
                            }else{
                              return null;
                            }
                          },
                          obscureText: false,
                          prefixIcon: Image.asset("assets/images/user.png"),
                          hintText: 'User Name',
                        ),
                        const SizedBox(
                          height: 20,
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

                        const SizedBox(
                          height: 40,
                        ),
                        CheckWidget(),

                        const SizedBox(
                          height: 40,
                        ),

                        AuthButton(
                          text: 'Sign Up'.toUpperCase(),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomContainer(
                fText: "Don't have an Account ?",
                sText: 'Login',
              onPressed: (){
                Get.offNamed(Routes.loginScreen);
                print("pressed");
              },
              ),
           ],
          ),
        ),
      ),
    );
  }
}
