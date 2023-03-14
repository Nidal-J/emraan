import 'package:flutter/material.dart';
import '../../../../widgets/top_right_radius.dart';

class CustomerPrivacyPolicyScreen extends StatelessWidget {
  const CustomerPrivacyPolicyScreen({super.key});

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
