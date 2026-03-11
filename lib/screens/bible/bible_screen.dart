import 'package:flutter/material.dart';

class BibleScreen extends StatelessWidget {
  const BibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Telugu Bible"),
      ),
      body: const Center(
        child: Text(
          "Bible will load here",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}