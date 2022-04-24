import 'UI/UI.dart';
import 'package:flutter/material.dart';
import 'UI/theme.dart';
import 'dart:async';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  ThemeMode theme = ThemeMode.light;
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        theme = MyHomePage.theme;
      });
    });
  }

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: theme,
      theme: Mytheme.lightTheme,
      darkTheme: Mytheme.darkTheme,
      home: MyHomePage(title: 'Clock App'),
    );
  }
}
