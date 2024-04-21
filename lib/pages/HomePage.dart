import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:image_picker/image_picker.dart';
import 'package:popover/popover.dart';
import 'package:recieptify/components/PopCol.dart';
import 'package:recieptify/components/SubButton.dart';
import 'package:recieptify/components/db.dart';
import 'package:recieptify/pages/MathPage.dart';
import 'package:recieptify/pages/PhyPage.dart';
import 'package:recieptify/pages/ChemPage.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File ? selimg;
  Map<String,dynamic> brev = {};
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodPage()));
                    
                      },
                      child: SubButton(image: AssetImage("lib/images/bank.jpg"),
                      text: "Bank",),
                    ),
                    SubButton(image: AssetImage("lib/images/other.png"),
                    text: "Others",),
                    

                  ],
                ),
               GestureDetector(
      onTap: () async{
        
        await pickGal();
        showModalBottomSheet(context: context, builder: (BuildContext context){
          return ListItems();
        });
        
      }, 
      
      child: Icon(Icons.camera_alt_rounded,color: Color(0xFF90DCD0)),
      
    ),
     GestureDetector(
      onTap: () {
        print(choice);
        if(choice=="Grocery"){
          Grocery[brev['first_word_heading']] = brev['money'];
          grimg.add(selimg!);
          print("done");
        }
        if(choice=="Food"){
          Food[brev['first_word_heading']] = 400;
          fdimg.add(selimg!);
          print("done");
        }
        if(choice=="Bank"){
          Bank[brev['first_word_heading']] = 400;
          bkimg.add(selimg!);
          print("done");
        }
        if(choice=="Other"){
          Other[brev['first_word_heading']] = 400;
          otimg.add(selimg!);
          print("done");
        }
        
      }, 
      
      child: Icon(Icons.add_box,color: Color(0xFF90DCD0)),
      
    ),
    
              ]),
            ),
      ),
    );
  }
  Future pickGal ()async{
     final img =await ImagePicker().pickImage(source: ImageSource.gallery);
  setState(() {
    selimg =File(img!.path);
  });
  sendImageToFlask();
}
Future pickcam ()async{
     final img =await ImagePicker().pickImage(source: ImageSource.camera);
     if(img==null)return;
  setState(() {
    selimg =File(img!.path);
  });
  
}
 Future<void> sendImageToFlask() async {
    if (selimg == null) return;

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:5000/process_receipt'));

    // Add the image file to the request
    var imageFile = await http.MultipartFile.fromPath('file', selimg!.path);
    request.files.add(imageFile);

    // Send the request
    var response = await request.send();

    // Read the response from the server
    var responseText = await response.stream.bytesToString();
    Map<String, dynamic> jsonResponse = jsonDecode(responseText);
    brev = jsonResponse;

    // Update the state with the response
    setState(() {
      print(jsonResponse);
      print(Grocery);
      

    });
    
  }
}

