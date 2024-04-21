import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recieptify/pages/AboutPage.dart';
import 'package:recieptify/pages/Budget.dart';
import 'package:recieptify/pages/GraphPage.dart';
import 'package:recieptify/pages/HomePage.dart';


class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {


  int _selectedIndex = 1;
   List<Widget> yoo = [GraphPage(),HomePage(),BudgetPage(),PersonalDetailsPage() ];
  

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: yoo[_selectedIndex],
      
      bottomNavigationBar: GNav(
      onTabChange: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
      selectedIndex: _selectedIndex,
      color: Color(0xFFE9F4FA),
      backgroundColor: Color(0xFFE9F4FA),
      activeColor: Color(0xFFE9F4FA),
      tabBackgroundColor: Color(0xFF2D5056),
      tabMargin: EdgeInsets.all(4),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      
      gap: 2,
      iconSize: 25,
      tabs: [
      
      GButton(text:"Expense",
      textStyle: TextStyle(color: Colors.white),
        iconColor: Colors.black,
        icon: Icons.auto_graph_outlined,
        
        
        ),
      GButton(icon: Icons.home_outlined,
      iconColor: Colors.black,
              text: "Home",
              ),
              GButton(text: "Budget",
      iconColor: Colors.black,
        icon: Icons.monetization_on_outlined,
              ),
      GButton(text: "Profile",
      iconColor: Colors.black,
        icon: Icons.person_2_outlined,
              ),
    
    ]),));
  }
}