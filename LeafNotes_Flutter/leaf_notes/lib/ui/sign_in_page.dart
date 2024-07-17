import 'package:flutter/material.dart';

import 'widgets/d_button.dart';
import 'widgets/d_gap.dart';
import 'widgets/d_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController _emailController =  TextEditingController();
  TextEditingController _passwordController =  TextEditingController();

  @override
  //TO PREVENT MEMORY LEAKAGE
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("SIGN IN"), centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            DTextField(hintText: "Email", controller: _emailController, icon: Icons.email),
            const DGap(),
            DTextField(hintText: "Password", controller: _passwordController, icon: Icons.password, obscureText: true,),
            const DGap(),
            DButton(text: "Sign Up", onPressed: () {
              
              
              print("Signed In ${_emailController.value.text}");
              print("E-mail: ${_emailController.value.text}");
              print("Password: ${_passwordController.value.text}");
              
              
              }),

          ],
        ),
      ),

    );
  }
}