import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/core/components/themedata_comp.dart';
import 'package:study/provider/bottom_navigation_bar_provider.dart';
import 'package:study/provider/checkbox_provider.dart';
import 'package:study/provider/pageview_provider.dart';
import 'package:study/provider/route_provider.dart';
import 'package:study/provider/sign_in_provider.dart';
import 'package:study/provider/upload_provider.dart';
import 'package:study/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RouteProvider()),
        ChangeNotifierProvider(create: (_) => SigninProvider()),
        ChangeNotifierProvider(create: (_) => PageViewProvider()),
        ChangeNotifierProvider(create: (_) => CheckBoxProvider()),
        ChangeNotifierProvider(create: (_) => UploadProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavigationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final MyRouter _myRouter = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeComp.myTheme,
      onGenerateRoute: _myRouter.OnGenerateRoute,
      initialRoute: '/start',
    );
  }
}
