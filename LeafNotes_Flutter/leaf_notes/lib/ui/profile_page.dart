import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leaf_notes/cubit/user/user_cubit.dart';
import 'package:leaf_notes/models/user_model.dart';
import 'package:leaf_notes/router/page_const.dart';
import 'package:leaf_notes/ui/widgets/common/d_button.dart';
import 'package:leaf_notes/ui/widgets/common/d_outlined_button.dart';
import 'package:leaf_notes/ui/widgets/common/d_gap.dart';
import 'package:leaf_notes/ui/widgets/common/d_snackbar.dart';
import 'package:leaf_notes/ui/widgets/common/d_text_field.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getProfile(UserModel(uid: widget.uid));
  }

  @override
  //TO PREVENT MEMORY LEAKAGE
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, userState) {

          if(userState is UserLoaded){
            _updateDetails(userState.user);

                      return Container(
            margin: EdgeInsets.all(dMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Username"),
                const DGap(),
                DPasswordTextField(
                    hintText: "Username", controller: _usernameController),
                const DGap(),
                const Text("Email"),
                const DGap(),
                AbsorbPointer(
                    child: DPasswordTextField(
                        hintText: "Email", controller: _emailController)),
                const DGap(),
                DButton(text: "Update Profile", onPressed: _updateProfile),
              ],
            ),
          );
            
          }else{
            return Center(child: CircularProgressIndicator());
          }




        },
      ),
    );
  }

  void _updateProfile() {
    //check if email is left empty
    if(_emailController.text.isEmpty){
      dSnackBar(context,"Enter email please.",isError: true );
      return;
    }
    context.read<UserCubit>().updateProfile(UserModel(uid: widget.uid, username: _usernameController.text )).then((value) {
      dSnackBar(context, "Profile updated successfully");
    });
  }

  void _updateDetails(UserModel user) {
  _emailController.value = TextEditingValue(text: user.email!);
  _usernameController.value = TextEditingValue(text: user.username!);
}

}

