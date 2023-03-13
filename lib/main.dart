import 'package:components/components.dart';
import 'package:flutter/material.dart';

import 'ui/ui.dart';

void main() {
  runApp(const MyApp());
}

//// ADD the repository

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: simpleAppTheme(),
      home: const NewsFeedScreen(),
    );
  }
}
