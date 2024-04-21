import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recieptify/components/db.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Receipts'),
      ),
      body: ListView.builder(
        itemCount: bkimg.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodImageDetailPage(image: bkimg[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                bkimg[index],
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

class FoodImageDetailPage extends StatefulWidget {
  final File image;

  const FoodImageDetailPage({Key? key, required this.image}) : super(key: key);

  @override
  _FoodImageDetailPageState createState() => _FoodImageDetailPageState();
}

class _FoodImageDetailPageState extends State<FoodImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.file(
            widget.image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
