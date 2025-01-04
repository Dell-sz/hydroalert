import 'package:flutter/material.dart';
import 'hydration_config_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HydroAlert',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HydrationConfigScreen(),
    );
  }
}
