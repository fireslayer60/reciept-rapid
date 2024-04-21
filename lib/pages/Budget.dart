import 'package:flutter/material.dart';
import 'package:recieptify/components/db.dart'; // Import your db.dart file

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  String tee = "";
  String tee2="";
 List<List<String>> emptyList = [];
 
 void makeList(){
              if(grleft<=50){
                  emptyList.add(["Grocery",grleft.toString()]);
              }
              if(fdleft<=50){
                  emptyList.add(["Food",fdleft.toString()]);
              }
              if(otleft<=50){
                  emptyList.add(["Other",otleft.toString()]);
              }
              if(bkleft<=50){
                  emptyList.add(["Bank",bkleft.toString()]);
              }
 }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Text(
              'Set Budget for Expenditure',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xFF90DCD0),),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text(
                    'Grocery Budget: $grbudget\$',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Slider(
              
              value: grbudget.toDouble(),
              min: 0,
              max: 1000,
              divisions: 200,
              activeColor: Color(0xFF2D5056),
              label: grbudget.toString(),
              onChanged: (double value) {
                setState(() {
                  grbudget = value.toInt();
                });
              },
            ),
            Text(
              'Food Budget: $fdbudget\$',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: fdbudget.toDouble(),
              min: 0,
              max: 1000,
              divisions: 200,
              activeColor: Color(0xFF2D5056),
              label: fdbudget.toString(),
              onChanged: (double value) {
                setState(() {
                  fdbudget = value.toInt();
                });
              },
            ),
            Text(
              'Other Budget: $otbudget\$',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: otbudget.toDouble(),
              min: 0,
              max: 1000,
              divisions: 200,
              activeColor: Color(0xFF2D5056),
              label: otbudget.toString(),
              onChanged: (double value) {
                setState(() {
                  otbudget = value.toInt();
                });
              },
            ),
            Text(
              'Bank Budget: $bkbudget\$',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: bkbudget.toDouble(),
              min: 0,
              max: 1000,
              divisions: 200,
              activeColor: Color(0xFF2D5056),
              label: bkbudget.toString(),
              onChanged: (double value) {
                setState(() {
                  bkbudget = value.toInt();
                });
              },
            ),
            SizedBox(height: 10,)
                ],
              ),
            ),
            
            // Add sliders for Other and Bank budgets similarly
            SizedBox(height: 20),
            Text('Areas you can spend less in',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ElevatedButton(onPressed: (){
              setState(() {
                makeList();
              for(List i in emptyList){
                tee+= "In "+i[0]+" only "+i[1]+" left \n";

              }
              emptyList=[];
              
              });
              
            }, child: Text('Check',style: TextStyle(fontSize: 18,color: Color(0xFF2D5056)),)),
            SizedBox(height: 10,),
            Text("$tee", style: TextStyle(fontSize: 16,))
          ],
        ),
      ),
    );
  }
}
