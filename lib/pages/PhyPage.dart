import 'package:flutter/material.dart';

class PhyPage extends StatefulWidget {
  const PhyPage({super.key});

  @override
  State<PhyPage> createState() => _PhyPageState();
}

class _PhyPageState extends State<PhyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 9, 0, 40),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Text("Physics Notes:",style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
      ),
    );
  }
}