import 'package:brainlab/games/verbal_memory.dart';
import 'package:brainlab/screens/home.dart';
import 'package:brainlab/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'games/verbal_memory.dart';
import 'games/visual_memory.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brain Lab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        splashColor: Colors.white,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.android,
      ),
      initialRoute:
          '/verbal',
          //'/visual', //(uid == null || uid == 'LoggedOut') ? '/auth' : '/mainMenu',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/verbal': (context) => VerbalMemory(),
        '/visual': (context) => VisualMemory(),
/*         '/': (context) => InnerWrapper(),
        '/mainMenu': (context) => MainMenu(),
        '/auth': (context) => Authenticate(), */
      },
    );
  }
}
