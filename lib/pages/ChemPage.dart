import 'package:flutter/material.dart';

class ChemPage extends StatefulWidget {
  const ChemPage({super.key});

  @override
  State<ChemPage> createState() => _ChemPageState();
}

class _ChemPageState extends State<ChemPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 9, 0, 40),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Text("Chemistry Notes:",style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
      ),
    );
  }
}