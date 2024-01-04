import 'package:flutter/material.dart';

class EvaluationTabWidget extends StatefulWidget {
  const EvaluationTabWidget({super.key});

  @override
  State<EvaluationTabWidget> createState() => _EvaluationTabWidgetState();
}

class _EvaluationTabWidgetState extends State<EvaluationTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Evaluation tab'),
      ),
    );
  }
}
