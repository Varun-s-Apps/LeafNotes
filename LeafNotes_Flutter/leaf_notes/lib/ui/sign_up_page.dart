import 'package:flutter/material.dart';
import 'package:leaf_notes/router/page_const.dart';
import 'package:leaf_notes/ui/sign_in_page.dart';
import 'package:leaf_notes/ui/widgets/d_button.dart';
import 'package:leaf_notes/ui/widgets/d_gap.dart';
import 'package:leaf_notes/ui/widgets/d_text_field.dart';
import 'package:leaf_notes/utils/constants/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController =  TextEditingController();
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
    
    return Scaffold(
      appBar: AppBar(title: Text("SIGN UP"), centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            DTextField(hintText: "Name", controller: _nameController, icon: Icons.person),
            const DGap(),
            DTextField(hintText: "Email", controller: _emailController, icon: Icons.email),
            const DGap(),
            DTextField(hintText: "Password", controller: _passwordController, icon: Icons.password, obscureText: true,),
            const DGap(),
            DButton(text: "Sign Up", onPressed: () {
              
              
              print("Signed Up ${_nameController.value.text}");
              print("E-mail: " + _emailController.value.text);
              print("Password: " +_passwordController.value.text);
              
              
              }),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Aready have an account?"),
                  DGap(isHorizontal: true,),
                  TextButton(onPressed: (){
                    //PUSH NAMED PAGE USING ROUTES INSTEAD OF NORMAL
                    Navigator.pushNamedAndRemoveUntil(context, PageConstants.signInPage, (route) => false);
                  }, child: Text("Sign In", style: TextStyle(color: dBlackColor),)),
                ],
              )

          ],
        ),
      ),

    );
    
    
    
    
  }
}