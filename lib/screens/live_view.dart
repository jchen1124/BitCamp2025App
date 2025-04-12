import 'package:flutter/material.dart';

class LiveView extends StatefulWidget {
  const LiveView({super.key});

  State<LiveView> createState() {
    return _LiveView();
  }
}

class _LiveView extends State<LiveView> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 110, 126),
        title: Text(
          'Live Environment',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
