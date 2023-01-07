import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  double firstNum=0.0;
  double secondNum=0.0;
  var input='';
  var output='';
  var operation='';
  var hideInput=false;
   var outputSize=36.0;
  MaterialColor operatorColor=Colors.red;

  get p => null;

  onButtonClick(value){
    if(value=='AC'){
      input='';
      output='';
    }
    else if(value=='<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    }
      else if (value == '=') {
        if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if(output.endsWith('.0')){
        output=output.substring(0,output.length-2);
        }
        input=output;
        hideInput=true;
        outputSize=50;
      }
    }
    else{
      input=input+value;
      hideInput=false;
      outputSize=34;
    }
    setState(() {

    });
  }

  get text => null;
  get tColor => null;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Simple Calculator',
          textAlign: TextAlign.center,),
      ),

        body: Column(
          children: [Expanded(child:Container(
            width: double.infinity,
            padding: const EdgeInsets.all(13),
            color: Colors.white30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Text(hideInput?'':input,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 39,
                  color: Colors.black,
                 ),
                ),

                const SizedBox(
                  height: 12,
                ),

                Text(output,
                  style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: outputSize,
                      color: Colors.black,

                  ),
                ),

                const SizedBox(
                  height: 18,
                 ),
               ],
             ),
           ),
          ),

            Row(
              children:  [
                button(text: 'AC', tColor: Colors.yellow,buttonBgColor: Colors.white38),
                button(text:'<', tColor: Colors.yellow,buttonBgColor: Colors.white38),
                button(text: '', tColor: Colors.transparent,buttonBgColor: Colors.transparent),
                button(text: '/', tColor: Colors.yellow,buttonBgColor: Colors.white38),
              ],
            ),

            Row(
              children:  [
                button(text: '7', tColor: Colors.white,),
                button(text:'8', tColor: Colors.white,),
                button(text: '9', tColor: Colors.white,),
                button(text: '*', tColor: Colors.yellow,buttonBgColor: Colors.white38),
              ],
            ),

            Row(
              children:  [
                button(text: '4', tColor: Colors.white,),
                button(text:'5', tColor: Colors.white,),
                button(text: '6', tColor: Colors.white,),
                button(text: '-', tColor: Colors.yellow,buttonBgColor: Colors.white38),
              ],
            ),

            Row(
              children:  [
                button(text: '1', tColor: Colors.white,),
                button(text:'2', tColor: Colors.white,),
                button(text: '3', tColor: Colors.white,),
                button(text: '+', tColor: Colors.yellow,buttonBgColor: Colors.white38,),
              ],
            ),

            Row(
              children:  [
                button(text: '%', tColor: Colors.yellow,),
                button(text:'0', tColor: Colors.white,),
                button(text: '.', tColor: Colors.white,),
                button(text: '=', tColor: Colors.yellow,buttonBgColor: Colors.white38,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button({
      text,tColor=Colors.white,buttonBgColor=Colors.blueGrey,})
  {
    return Expanded(child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
           backgroundColor:buttonBgColor,
            padding: const EdgeInsets.all(18)),
            onPressed:() => onButtonClick(text), child:  Text(text,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: tColor,
           ),
          ),
        )
      )
    );
  }
}


