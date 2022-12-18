import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:riverpod_apicall/features/users/presentation/widgets/user_screen.dart';

import '../unknown/presentation/widgets/unknown_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('see user'),
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const UserScreen()));
              },
            ),
            ElevatedButton(
              child: const Text('see Unknown'),
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const UnknownScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
