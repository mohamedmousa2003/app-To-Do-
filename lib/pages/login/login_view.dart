import 'package:flutter/material.dart';
import 'package:todo/const/string_const.dart';
import 'package:todo/core/app_colors.dart';
import 'package:todo/pages/register/register_view.dart';
import 'package:todo/pages/widget/custom_text_field.dart';

import '../widget/build_tap_container.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var passwordController = TextEditingController();

  var userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                login,
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
                height: 8,
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
                hint: enterUserName,
                isPassword: true,
                onValidate: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return "please enter your Name";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: iconColorBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      login,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
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
              const SizedBox(height: 40),
              BuildTapContainer(
                onTap: () {},
                title: loginWithGoogle,
                image: "assets/images/icon_google.png",
              ),
              const SizedBox(height: 20),
              BuildTapContainer(
                  onTap: () {},
                  title: loginWithApple,
                  image: "assets/images/icon_apple.png"),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    noAccount,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(color: whiteColor.withOpacity(0.60)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterView.routeName);
                    },
                    child: Text(
                      register,
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
    );
  }
}
