import 'package:flutter/material.dart';
import 'package:todo/core/app_colors.dart';
import 'package:todo/pages/login/login_view.dart';
import 'package:todo/pages/register/register_view.dart';

import '../../const/string_const.dart';
import '../widget/custom_button.dart';

class StartScreenView extends StatelessWidget {
  const StartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Welcome to UpTodo",
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 27),
                Text(
                  "Please login to your account or create new account to continue",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(color: whiteColor.withOpacity(.67)),
                ),
              ],
            ),
            Column(
              children: [
                CustomButton(
                  title: login.toUpperCase(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginView(),
                      ),
                    );
                  },
                ),
                /*
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginView(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: iconColorBlue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
                */
                SizedBox(
                  height: 28,
                ),
                CustomButton(
                  title: createAccount.toUpperCase(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RegisterView(),
                      ),
                    );
                  },
                ),
                /*
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RegisterView(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: blackColor,
                      border: Border.all(
                        color: iconColorBlue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "CREATE ACCOUNT",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
                */
              ],
            ),
          ],
        ),
      ),
    );
  }
}
