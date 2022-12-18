import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:riverpod_apicall/features/home/home_page.dart';

class Riverpoad extends StatelessWidget {
  const Riverpoad({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: Homepage(),
    );
  }
}
