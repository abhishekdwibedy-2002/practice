// Flutter Provider State Management

import 'package:flutter/material.dart';
import 'package:practice/home.dart';
import 'package:practice/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Initializing the Multiple Provider
      providers: [
        ChangeNotifierProvider(
          create: (context) => NumberListProvider(),
        )
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
