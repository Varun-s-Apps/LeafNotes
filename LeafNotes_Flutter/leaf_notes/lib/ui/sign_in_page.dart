import 'package:flutter/material.dart';
import 'package:leaf_notes/ui/sign_up_page.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';
import 'package:leaf_notes/utils/text_themes/text_styles.dart';

import '../router/page_const.dart';
import '../utils/constants/colors.dart';
import 'widgets/d_button.dart';
import 'widgets/d_gap.dart';
import 'widgets/d_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  //TO PREVENT MEMORY LEAKAGE
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("LEAF NOTES"),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //IMAGE
            SizedBox(
                height: 250,
                child: Image.asset(
                  "assets/images/notebook.png",
                  filterQuality: FilterQuality.medium,
                )),

            Text("Sign In", style: boldHeading()),
            const DGap(),
            //TextFields
            DTextField(
                hintText: "Email",
                controller: _emailController,
                icon: Icons.email),
            const DGap(),
            DTextField(
              hintText: "Password",
              controller: _passwordController,
              icon: Icons.password,
              obscureText: true,
            ),
            const DGap(),
            DButton(
                text: "Sign In",
                onPressed: () {
                  print("Signed In ${_emailController.value.text}");
                  print("E-mail: ${_emailController.value.text}");
                  print("Password: ${_passwordController.value.text}");
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const DGap(
                  isHorizontal: true,
                ),
                TextButton(
                  onPressed: () {
                    //PUSH NAMED PAGE USING ROUTES INSTEAD OF NORMAL
                    Navigator.pushNamedAndRemoveUntil(
                        context, PageConstants.signUpPage, (route) => false);
                  },
                  child: const Text("Sign Up",
                      style: TextStyle(color: dBlackColor)),
                ),
              ],
            ),
            const DGap(gap: dMargin * 3),
          ],
        ),
      ),
    );
  }
}
