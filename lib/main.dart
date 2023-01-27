import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:custom_login/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Login',
      home: HomeScreen(),
    );
  }
}
