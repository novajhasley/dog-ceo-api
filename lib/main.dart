import 'package:dog_ceo_api/presentation/widgets/nav_bar_holder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavBarHolder(),
    );
  }
}
