import 'package:flutter/material.dart';

class SubjectTabWidget extends StatefulWidget {
  const SubjectTabWidget({super.key});

  @override
  State<SubjectTabWidget> createState() => _SubjectTabWidgetState();
}

class _SubjectTabWidgetState extends State<SubjectTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Subject tab'),
      ),
    );
  }
}
