import 'package:flutter/material.dart';
import 'package:leaf_notes/router/page_const.dart';
import 'package:leaf_notes/ui/widgets/common/d_button.dart';
import 'package:leaf_notes/ui/widgets/common/d_gap.dart';
import 'package:leaf_notes/ui/widgets/common/d_text_field.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
      body: Container(
        margin: EdgeInsets.all(dMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Username"),
            const DGap(),
            DTextField(hintText: "Username", controller: _usernameController),
            const DGap(),
            const Text("Email"),
            const DGap(),
            AbsorbPointer(
                child: DTextField(
                    hintText: "Email", controller: _emailController)),
            const DGap(),
            DButton(text: "Update Profile", onPressed: _updateProfile),
          ],
        ),
      ),
    );
  }

  void _updateProfile() {}
}
