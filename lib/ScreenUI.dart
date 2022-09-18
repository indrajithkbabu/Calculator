import 'package:calculator/ScreenButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:math_expressions/math_expressions.dart';

class ScreenUI extends StatefulWidget {
  const ScreenUI({Key? key}) : super(key: key);

  @override
  State<ScreenUI> createState() => _ScreenUIState();
}

class _ScreenUIState extends State<ScreenUI> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    "/",
    '9',
    '8',
    '7',
    "*",
    '6',
    '5',
    '4',
    "-",
    '3',
    '2',
    '1',
    "+",
    '0',
    '.',
    '00',
    "="
  ];
  var userQue ='' ;
  var userAns  ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(userQue,style : TextStyle ( fontSize : 35 ) , )),
                    SizedBox(height: 10,),
                                                         
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(userAns,style: TextStyle(fontSize: 35),))
                ],
              ),
            ),
          )),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15),
                itemBuilder: (BuildContext context,int index) {
                 if(index==0){
                    return    ScreenButtons(
                   
                    buttonText: buttons[index],
                    color:  Colors.greenAccent ,
                    textColor: Colors.white,
                     buttonTapped: (){
                      setState(() {
                        userQue='';
                        userAns ='';
                      });
                     }, );

                 } else if(index==1){
                    return    ScreenButtons(
                      
                    buttonText: buttons[index],
                    color:  Colors.redAccent ,
                    textColor: Colors.white,
                     buttonTapped: (){
                      setState(() {
                         userQue =userQue.substring(0,userQue.length-1);
                      });
                     
                     } );
                 }
                  else if(index==buttons.length-1){
                    return    ScreenButtons(
                      
                    buttonText: buttons[index],
                    color:  Colors.redAccent ,
                    textColor: Colors.white,
                     buttonTapped: (){
                      setState(() {
                        equalTapped ();
                        
                      });
                     
                     } );
                 }
                 else{
                   return    ScreenButtons(
                   
                    buttonText: buttons[index],
                    color: isOperator(buttons[index]) ? Colors.deepPurple : Colors.deepPurple[50],
                    textColor: isOperator(buttons[index]) ? Colors.white : Colors.deepPurple,
                     buttonTapped: (){
                      setState(() {
                        userQue=userQue +buttons[index];
                      });
                     },);
                 }
                    

                },
                itemCount: buttons.length,
              )),
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true;
    }else{
       return false;
    }
   
  }

  void equalTapped(){
final finalQue =userQue;
     Parser p = Parser();
      Expression exp = p.parse(finalQue);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      userAns =eval.toString();
  }
}
