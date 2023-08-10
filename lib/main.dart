import 'package:flutter/material.dart';
import 'package:liptone_news/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liptone News',
      theme: ThemeData(
        primaryColor: Colors.white,
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
