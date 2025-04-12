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
        backgroundColor: Color(0xFF47E0F8),
        title: Text('Live Environment', 
        style: TextStyle(color: Colors.black)),
        
      ),
    );
  }
}
