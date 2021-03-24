import 'package:flutter/material.dart';

class SchoolScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('School'),
        ),
        body: SafeArea(child: Text('School')));
  }
}
