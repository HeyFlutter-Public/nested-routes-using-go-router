import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Explore')),
        body: const Center(
          child: Text(
            'This is Explore Page',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
}
