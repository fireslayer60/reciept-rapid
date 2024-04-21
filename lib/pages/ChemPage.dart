import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recieptify/components/db.dart';

class ChemPage extends StatefulWidget {
 

  const ChemPage({Key? key, }) : super(key: key);

  @override
  _ChemPageState createState() => _ChemPageState();
}

class _ChemPageState extends State<ChemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Receipts'),
      ),
      body: ListView.builder(
        itemCount: fdimg.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle image enlargement here
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChemImageDetailPage(image: fdimg[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                fdimg[index],
                width: 100, // Initial width
                height: 100, // Initial height
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChemImageDetailPage extends StatefulWidget {
  final File image;

  const ChemImageDetailPage({Key? key, required this.image}) : super(key: key);

  @override
  _ChemImageDetailPageState createState() => _ChemImageDetailPageState();
}

class _ChemImageDetailPageState extends State<ChemImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Pop the route to return to the previous screen
            Navigator.pop(context);
          },
          child: Image.file(
            widget.image,
            // Adjust width and height as needed for enlargement
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
