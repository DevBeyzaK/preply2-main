import 'package:flutter/material.dart';
import 'package:preply_clone/login.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
theme: ThemeData(
  primaryColor: Color.fromRGBO(255, 122, 172, 1),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white, // Tema üzerinden arka plan rengi
    ),
),
debugShowCheckedModeBanner: false,
home:Login() ,
    );
  }
}