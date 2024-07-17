import 'package:flutter/material.dart';
import 'package:leaf_notes/router/page_const.dart';
import 'package:leaf_notes/ui/sign_in_page.dart';
import 'package:leaf_notes/ui/sign_up_page.dart';

class OnGenerateRoute {

  //Router function. Accessible from all other pages.
  static Route<dynamic> route (RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConstants.signUpPage:{
        return materialPageBuilder(widget: const SignUpPage());
      }
      case PageConstants.signInPage:{
        return materialPageBuilder(widget: const SignInPage());
      }
      default:{
        return  materialPageBuilder(widget: const ErrorPage());
      }
       
    }
    //
  }
}

//ERROR PAGE IF ROUTING GOES WRONG
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ERROR"),
        centerTitle: true,
      ),
      body: Center(child: Text("Error in changing Page")),
    );
  }
}

MaterialPageRoute materialPageBuilder({required Widget widget}) {

  //(_) because no context is required
  return MaterialPageRoute(builder: (_) => widget);
}
