import 'package:flutter/material.dart';

class MathPage extends StatefulWidget {
  const MathPage({super.key});

  @override
  State<MathPage> createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 9, 0, 40),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Text("Maths Notes:",style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
      ),
    );
  }
}