import 'package:flutter/material.dart';

import '../../const/string_const.dart';
import '../../core/app_colors.dart';
import '../widget/build_tap_container.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  static String routeName = "register";
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var userNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  register,
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  userName,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(color: whiteColor.withOpacity(.87)),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: userNameController,
                  hint: enterUserName,
                  onValidate: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please enter your Name";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  password,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(color: whiteColor.withOpacity(.87)),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: passwordController,
                  hint: password,
                  isPassword: true,
                  onValidate: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please enter your Password";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  confirmPassword,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(color: whiteColor.withOpacity(.87)),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: confirmPasswordController,
                  hint: password,
                  isPassword: true,
                  onValidate: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please enter match Password";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  title: register,
                  onTap: () {},
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: orColor,
                        endIndent: 4,
                        thickness: 1.5,
                      ),
                    ),
                    Text(
                      "OR",
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: orColor,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: orColor,
                        thickness: 1.5,
                        indent: 4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                BuildTapContainer(
                  onTap: () {},
                  title: registerWithGoogle,
                  image: "assets/images/icon_google.png",
                ),
                const SizedBox(height: 20),
                BuildTapContainer(
                  onTap: () {},
                  title: registerWithApple,
                  image: "assets/images/icon_apple.png",
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      haveAccount,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(color: whiteColor.withOpacity(0.60)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        login,
                        style: theme.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
