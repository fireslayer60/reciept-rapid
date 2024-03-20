import 'package:flutter/material.dart';
import 'package:recieptify/components/SubButton.dart';
import 'package:recieptify/pages/MathPage.dart';
import 'package:recieptify/pages/PhyPage.dart';
import 'package:recieptify/pages/ChemPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
              backgroundColor: Color(0xFFA5DB63),
              actions: [
                Container(
                  margin: EdgeInsets.only(left:10,right: 10,bottom: 10,top: 5),
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                      Container(
            
              
              height: 20,
              width: 40,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/images/img.png"),fit: BoxFit.fill)),
            ),
                      
                        Expanded(
                          
                            child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '  Search ...',
                          ),
                        ),
                      ),
                      SizedBox(width: 40,),
                      
                    ],
                  ),
                ),
                IconButton(
                        icon: Icon(Icons.menu,color: Colors.black,),
                        onPressed: () {},
                      ),
              ],
            ),

            body: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
              
                Text("My Receipts:",style: TextStyle(color: Color(0xFF00224D),fontSize: 20,fontWeight: FontWeight.w300),),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PhyPage()));
                      },
                      child: SubButton(image: AssetImage("lib/images/gro.jpg"),
                      text: "Grocery",),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChemPage()));
                      },
                      child: SubButton(image: AssetImage("lib/images/food.jpg"),
                      text: "Food",),
                    ),
                    

                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MathPage()));
                    
                      },
                      child: SubButton(image: AssetImage("lib/images/bank.jpg"),
                      text: "Bank",),
                    ),
                    SubButton(image: AssetImage("lib/images/other.png"),
                    text: "Others",),
                    

                  ],
                ),
                IconButton(onPressed: (){}, 
                  splashColor: Color(0xFF00224D),
                  splashRadius: 20,
                  
                icon: Icon(Icons.camera_alt_rounded),
                color: Color(0xFF90DCD0),)
              ]),
            ),
      ),
    );
  }
}