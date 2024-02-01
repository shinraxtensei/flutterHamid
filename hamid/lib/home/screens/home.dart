import 'package:flutter/material.dart';
import 'package:hamid/home/widgets/cards.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Cards(),
      ),
    );
  }
}
