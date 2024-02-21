import 'package:finance_schedule/screens/Home.dart';
import 'package:finance_schedule/screens/widgets/CostHomeCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Schedule',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: Home(),
      routes: <String,WidgetBuilder>{
        '/home':(BuildContext context) => Home(),
        // '/new-expanse':(BuildContext context) => NewExpanse(),
      },
    );
  }
}