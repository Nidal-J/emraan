import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اللغة'),
      ),
      body: TopRightRadius(
        child: Column(),
      ),
    );
  }
}
