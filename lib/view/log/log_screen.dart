import 'package:flutter/material.dart';
import 'package:sneaker_shop_app/view/log/widget/sign_in.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SigninScreen(),
      )
    );
  }
}