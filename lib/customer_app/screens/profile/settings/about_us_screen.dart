import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عن التطبيق'),
      ),
      body: TopRightRadius(
        child: Column(),
      ),
    );
  }
}
