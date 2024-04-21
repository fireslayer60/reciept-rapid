import 'package:flutter/material.dart';
import 'package:recieptify/components/db.dart';

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      margin: EdgeInsets.only(top: 40,left:10,right:10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BotUpCard(text:"Grocery",color:Color(0xFF90DCD0)),
          BotUpCard(text:"Food",color:Color(0xFF90DCD0)),
          BotUpCard(text:"Bank",color:Color(0xFF90DCD0)),
          BotUpCard(text:"Other",color:Color(0xFF90DCD0)),
          ]
           
        

      )
    );
  }
}

class BotUpCard extends StatelessWidget {
  final String text;
  final Color color;

  const BotUpCard({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        choice = text;
         
        print(text);
        
        Navigator.pop(context);
        
      },
      child: Container(
        height: 98,
        width: MediaQuery.of(context).size.width-5,
        color: color,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
