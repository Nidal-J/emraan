import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سياسة الخصوصية'),
      ),
      body: TopRightRadius(
        child: Column(),
      ),
    );
  }
}
