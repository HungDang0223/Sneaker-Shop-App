import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black,),
          ),
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
