import 'package:flutter/material.dart';
import 'package:schoolmate/core/file_path.dart';

class SmsGatewaysPage extends StatelessWidget {
  static const String routeName = '/sms-gateways';

  const SmsGatewaysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SchoolMateAppBar(
        title: "SMS Gateways",
        subtitle: "Communication Management",
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          "SMS Gateways Page - Coming Soon",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
