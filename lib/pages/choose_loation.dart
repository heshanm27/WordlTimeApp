import 'package:flutter/material.dart';

class location extends StatefulWidget {
  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text("Locations"),
        centerTitle: true,
        elevation: 0,
      ),

      body: Text("Location"),


    );
  }
}
