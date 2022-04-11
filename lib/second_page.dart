import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String? payload;
  SecondPage({required this.payload});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(payload ?? ''), Text('Payload')],
        ),
      ),
    );
  }
}
