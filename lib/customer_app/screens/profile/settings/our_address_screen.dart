import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';

class OurAddressScreen extends StatelessWidget {
  const OurAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عنواننا'),
      ),
      body: TopRightRadius(
        child: Column(),
      ),
    );
  }
}
