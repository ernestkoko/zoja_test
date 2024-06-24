import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  final String error;

  const ErrorDisplay({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Error: $error'));
  }
}