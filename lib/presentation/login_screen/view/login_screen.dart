import 'package:flutter/material.dart';
import 'package:omnisell_worksportal/core/constants/textstyles.dart';
import 'package:omnisell_worksportal/presentation/login_screen/controller/login_controller.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Omnisell - Dashboard",
            style: GLTextStyles.cabinStyle(size: 22),
          ),
          centerTitle: true,
          forceMaterialTransparency: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: GLTextStyles.interStyle(size: 18),
                ),
                SizedBox(height: size.width * .03),
                Text(
                  "Email Address",
                  style: GLTextStyles.interStyle(
                      size: 14, weight: FontWeight.w500),
                ),
                SizedBox(height: size.width * .02),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff1A3447)),
                    ),
                  ),
                ),
                SizedBox(height: size.width * .03),
                Text(
                  "Password",
                  style: GLTextStyles.interStyle(
                      size: 14, weight: FontWeight.w500),
                ),
                SizedBox(height: size.width * .02),
                Consumer<LoginController>(builder: (context, controller, _) {
                  return TextFormField(
                    obscureText: controller.visibility,
                    obscuringCharacter: '*',
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {
                          controller.onPressed();
                        },
                        icon: Icon(controller.visibility == true
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xff1A3447)),
                      ),
                    ),
                  );
                }),
                SizedBox(
                  height: size.width * .04,
                ),
                SizedBox(
                  height: size.height * 0.085,
                  width: size.width * 0.95,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    color: ColorTheme.lightBlue,
                    onPressed: () {
                      Provider.of<LoginController>(context, listen: false)
                          .onLogin(emailController.text.trim(),
                              passwordController.text.trim(), context);
                    },
                    child: Text(
                      "Login",
                      style: GLTextStyles.cabinStyle(
                          color: ColorTheme.white,
                          size: 20,
                          weight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
