import 'package:flutter/material.dart';
import 'package:leaf_notes/router/on_generate_route.dart';
import 'package:leaf_notes/ui/sign_in_page.dart';
import 'package:leaf_notes/utils/theme_data/dark_theme_data.dart';
import 'package:leaf_notes/utils/theme_data/light_theme_data.dart';
import 'ui/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Leaf Notes',
      theme: lightTheme,
      darkTheme: darkTheme,
      // themeMode: ThemeMode.dark,
      themeMode: ThemeMode.light,

      //INITIAL ROUTING SETTINGS AND INITIALISATION
      onGenerateRoute: OnGenerateRoute.route,

      //INITIAL ROUTE
      routes: {
        "/" : (context){
          return SignInPage();
        }
      },


      // home: const SignUpPage()
      // home: const SignInPage()

    );
  }
}
