import 'package:flutter/material.dart';

class ChildPage extends StatelessWidget {
  const ChildPage(
      {super.key, required this.title, required this.body, this.actions});

  final String title;
  final Widget body;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: actions,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: body,
      ),
    );
  }
}
