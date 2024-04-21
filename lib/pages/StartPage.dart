import 'package:flutter/material.dart';
import 'package:recieptify/pages/HomePage.dart';
import 'package:recieptify/pages/navbar.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: Color(0xFF2D5056),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            SizedBox(height: 80,),
            Container(
            
              
              height: 60,
              width: 200,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/images/img.png"),fit: BoxFit.fill)),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20),
              
              height: 200,
              width: 200,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/images/img2.png"),fit: BoxFit.fill)),
            ),
            SizedBox(height: 30,),
            Container(
              
              width: 500,
              height: 389,
              decoration: BoxDecoration(color: Color(0xFFE9F4FA),borderRadius: BorderRadius.only(topLeft: Radius.circular(70),topRight: Radius.circular(70))),
              child: Column(
                children: [
                  Container( 
                    margin: EdgeInsets.only(top: 50),
                    width: 300,
                    child: Text("Your one stop spot to store all your Receipts and categorize them easily with the help of our AI ",
                    style: TextStyle(color: Color(0xFF00224D),fontSize: 16),textAlign: TextAlign.justify,)),
                    SizedBox(height: 50,),
              Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(color: Color(0xFF90DCD0),borderRadius: BorderRadius.circular(70)),
                child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>navbar()));
                }, child: const Text("Get Started",style: TextStyle(color: Color(0xFFFFFFFF)),))),

                ],
              ),
            ),
              
              
          ],
        
        ),
      ),
    );
  }
}