import 'package:flutter/material.dart';
import 'package:study/screens/home/home_page.dart';
import 'package:study/screens/pages/continue_page.dart';
import 'package:study/screens/pages/onboarding_pages/details_page.dart';
import 'package:study/screens/pages/sign_in_page.dart';
import 'package:study/screens/pages/sign_up_page.dart';
import 'package:study/screens/pages/onboarding_pages/start_page.dart';

class MyRouter {
  Route? OnGenerateRoute(RouteSettings s) {
    switch (s.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/signIn':
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/start':
        return MaterialPageRoute(builder: (_) => const StartPage());
      case '/details':
        return MaterialPageRoute(builder: (_) => DetailsPage());
      case '/continue':
        return MaterialPageRoute(builder: (_) => ContinuePage());
    }
  }
}
