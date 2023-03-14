import 'package:flutter/material.dart';
import '../../../../widgets/top_right_radius.dart';

class CustomerOurAddressScreen extends StatelessWidget {
  const CustomerOurAddressScreen({super.key});

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
