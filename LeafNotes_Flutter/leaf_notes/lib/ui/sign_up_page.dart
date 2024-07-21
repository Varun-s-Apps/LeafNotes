import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leaf_notes/cubit/auth/auth_cubit.dart';
import 'package:leaf_notes/cubit/credential/credential_cubit.dart';
import 'package:leaf_notes/models/user_model.dart';
import 'package:leaf_notes/router/page_const.dart';
import 'package:leaf_notes/ui/home_page.dart';
import 'package:leaf_notes/ui/sign_in_page.dart';
import 'package:leaf_notes/ui/widgets/common/d_button.dart';
import 'package:leaf_notes/ui/widgets/common/d_gap.dart';
import 'package:leaf_notes/ui/widgets/common/d_snackbar.dart';
import 'package:leaf_notes/ui/widgets/common/d_text_field.dart';
import 'package:leaf_notes/utils/constants/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
          if (credentialState is CredentialLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return HomePage(uid: authState.uid);
                } else {
                  // SIGN IN PAGE because user is not Authenticated
                  return _bodyWidget();
                }
              },
            );
          }
          return Container();
        },
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            context.read<AuthCubit>().loggedIn(credentialState.user.uid!);
          }

          if (credentialState is CredentialFailure) {
            dSnackBar(context, credentialState.errorMessage, isError: true);
          }
        },
      ),
    );
  }

  _bodyWidget() {
    Scaffold(
      appBar: AppBar(
        title: Text("SIGN UP"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DTextField(
                hintText: "Name",
                controller: _nameController,
                icon: Icons.person),
            const DGap(),
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
                text: "Sign Up",
                onPressed: () {
                  _submitSignUp();

                  print("Signed Up ${_nameController.value.text}");
                  print("E-mail: " + _emailController.value.text);
                  print("Password: " + _passwordController.value.text);
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Aready have an account?"),
                DGap(
                  isHorizontal: true,
                ),
                TextButton(
                    onPressed: () {
                      //PUSH NAMED PAGE USING ROUTES INSTEAD OF NORMAL
                      Navigator.pushNamedAndRemoveUntil(
                          context, PageConstants.signInPage, (route) => false);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: dBlackColor),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _submitSignUp() {
    if (_nameController.text.isEmpty) {
      dSnackBar(context, "Enter Username", isError: true);
      return;
    }

    if (_emailController.text.isEmpty) {
      dSnackBar(context, "Enter Email", isError: true);
      return;
    }

    if (_passwordController.text.isEmpty) {
      dSnackBar(context, "Enter Password", isError: true);
      return;
    }

    context.read<CredentialCubit>().signUp(UserModel(
        username: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text));
  }
}
