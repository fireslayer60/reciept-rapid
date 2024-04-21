
  import 'dart:io';

Map<String,int> Grocery = {
    "easyday": 60,
    "spencer": 50,
    "mother dairy": 20
  };
  Map<String,int> Food = {
    "Mcdonals": 20,
    "KFC": 15,
    "Subway": 10
  };
  Map<String,int> Bank = {
    "ICIC ATM": 200,
    
  };
  Map<String,int> Other = {
    "apollo": 10,
    "stationary": 5,
    
  };
  int grbudget = 500;
  int fdbudget = 500;
  int otbudget = 500;
  int bkbudget = 500;

  int grTotal = Grocery.values.reduce((value, element) => value + element);
int fdTotal = Food.values.reduce((value, element) => value + element);
int otTotal = Other.values.reduce((value, element) => value + element);
int bkTotal = Bank.values.reduce((value, element) => value + element);

int grleft = grbudget-grTotal;
int fdleft = fdbudget-fdTotal;
int otleft =otbudget-otTotal;
int bkleft = bkbudget-bkTotal;

String choice = "other";

List<File> grimg = [];
List<File> fdimg = [];
List<File> otimg = [];
List<File> bkimg = [];

