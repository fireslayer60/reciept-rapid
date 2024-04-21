import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recieptify/components/db.dart';

class PhyPage extends StatefulWidget {
 

  const PhyPage({Key? key, }) : super(key: key);

  @override
  _PhyPageState createState() => _PhyPageState();
}

class _PhyPageState extends State<PhyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery Receipts'),
      ),
      body: ListView.builder(
        itemCount: grimg.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle image enlargement here
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhyImageDetailPage(image: grimg[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                grimg[index],
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

class PhyImageDetailPage extends StatefulWidget {
  final File image;

  const PhyImageDetailPage({Key? key, required this.image}) : super(key: key);

  @override
  _PhyImageDetailPageState createState() => _PhyImageDetailPageState();
}

class _PhyImageDetailPageState extends State<PhyImageDetailPage> {
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
