import 'package:flutter/material.dart';
import 'package:leaf_notes/ui/sign_in_page.dart';
import 'ui/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leaf Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignUpPage()
      // home: const SignInPage()

    );
  }
}
