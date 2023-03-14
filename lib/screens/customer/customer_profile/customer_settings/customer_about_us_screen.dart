import 'package:flutter/material.dart';
import '../../../../widgets/top_right_radius.dart';

class CustomerAboutUsScreen extends StatelessWidget {
  const CustomerAboutUsScreen({super.key});

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
