import 'package:flutter/material.dart';

class XronicHomePage extends StatefulWidget {
  const XronicHomePage({super.key, required this.title});

  final String title;

  @override
  State<XronicHomePage> createState() => _XronicHomePageState();
}

class _XronicHomePageState extends State<XronicHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(),
    );
  }
}
