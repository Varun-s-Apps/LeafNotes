import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leaf_notes/cubit/auth/auth_cubit.dart';
import 'package:leaf_notes/cubit/credential/credential_cubit.dart';
import 'package:leaf_notes/router/on_generate_route.dart';
import 'package:leaf_notes/ui/home_page.dart';
import 'package:leaf_notes/ui/sign_in_page.dart';
import 'package:leaf_notes/utils/theme_data/dark_theme_data.dart';
import 'package:leaf_notes/utils/theme_data/light_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => AuthCubit()..appStarted()),
        BlocProvider<CredentialCubit>(create: (_) => CredentialCubit()),
      ],
      child: MaterialApp(
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
          "/": (context) {
            // return const HomePage();
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  if (authState.uid == "") {
                    return const SignInPage();
                  } else {
                    return HomePage(uid: authState.uid);
                  }
                } else {
                  return const SignInPage();
                }
              },
            );
          }
        },
      ),
    );
  }
}
