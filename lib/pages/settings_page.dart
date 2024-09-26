import 'package:flutter/material.dart';
import 'package:flutter_go_router/models/user.dart';
import 'package:flutter_go_router/router/routes.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = User(name: 'HeyFlutter', email: 'hello@heyflutter.com');

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is Settings Page', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => context.push(
                Routes.nestedProfilePage,
                extra: user,
              ),
              child: const Text('View Profile Page'),
            ),
          ],
        ),
      ),
    );
  }
}
