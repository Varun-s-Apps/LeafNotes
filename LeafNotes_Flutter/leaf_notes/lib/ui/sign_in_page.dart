import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leaf_notes/cubit/auth/auth_cubit.dart';
import 'package:leaf_notes/cubit/credential/credential_cubit.dart';
import 'package:leaf_notes/models/user_model.dart';
import 'package:leaf_notes/ui/home_page.dart';
import 'package:leaf_notes/ui/widgets/common/d_snackbar.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';
import 'package:leaf_notes/utils/text_themes/text_styles.dart';

import '../router/page_const.dart';
import '../utils/constants/colors.dart';
import 'widgets/common/d_button.dart';
import 'widgets/common/d_gap.dart';
import 'widgets/common/d_text_field.dart';

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
      body: BlocConsumer<CredentialCubit, CredentialState>(
        builder: (context, credentialState) {
          if(credentialState is CredentialLoading){
            return Center(
              child: CircularProgressIndicator(),
            );

          }

          if(credentialState is CredentialSuccess){
            return BlocBuilder<AuthCubit, AuthState>(builder: (context, authState) {
              
              if(authState is Authenticated){
                return HomePage(uid: authState.uid);

              }else{
                // SIGN IN PAGE because user is not Authenticated
                return _bodyWidget();
              }
            },);

          }
          return Container();
        },

        listener: (context, credentialState) {

          if(credentialState is CredentialSuccess){
            context.read<AuthCubit>().loggedIn(credentialState.user.uid!);
          }

          if(credentialState is CredentialFailure){
            dSnackBar(context, credentialState.errorMessage, isError: true);
          }
          
        },
      ),
    );
  }


  Widget _bodyWidget(){
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
                  _submitSignIn();
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
  
  void _submitSignIn() {

    if(_emailController.text.isEmpty){
      dSnackBar(context, "Enter Email", isError: true);
      return;
    }
  
  if(_passwordController.text.isEmpty){
      dSnackBar(context, "Enter Password", isError: true);
      return;
    }

  context.read<CredentialCubit>().signIn(UserModel(
    email: _emailController.text,
    password: _passwordController.text
  ));
}
}
