import 'package:flutter/material.dart';

class PersonalDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Personal Details'),
        backgroundColor: Color(0xFFA5DB63),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Name', 'John Doe'),
            SizedBox(height: 20,),
            _buildDetailRow('Age', '30'),
            SizedBox(height: 20,),
            _buildDetailRow('Address', '123 Main Street, Cityville'),
            SizedBox(height: 20,),
            _buildDetailRow('Email', 'john.doe@example.com'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        
        height: 80,
        width: 450,
        padding: EdgeInsets.all(10),
        decoration : BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xFF90DCD0),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3F4E52),
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
