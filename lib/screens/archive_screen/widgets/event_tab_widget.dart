import 'package:flutter/material.dart';

class EventTabWidget extends StatefulWidget {
  const EventTabWidget({super.key});

  @override
  State<EventTabWidget> createState() => _EventTabWidgetState();
}

class _EventTabWidgetState extends State<EventTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Event tab'),
      ),
    );
  }
}
