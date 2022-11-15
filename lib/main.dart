import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String operator="";
  String _output="";
  String output="";
  String iu="";
  double num1=0.0;
  double num2=0.0;
  String iu2="";

  buttonPressed(String buttonText){
    if(buttonText=="CLEAR"){
      num1=0.0;
      num2=0.0;
      operator="";
      _output="0";
      iu="";
      iu2="";
    }else if(buttonText=="+"||buttonText=="-"||buttonText=="/"||buttonText=="X"){
      num1=double.parse(output);
      operator=buttonText;
      setState((){
        iu=num1.toStringAsFixed(0)+operator;
        iu2="";
      });

      _output="0";
    }else if(buttonText=="."){
      if(_output.contains(".")){
        print("Already exsist demical");
      }else{
        _output=_output+buttonText;
      }
    }else if(buttonText=="="){
      num2=double.parse(output);
      setState((){
        iu2=num2.toStringAsFixed(0);
      });


      if(operator=="+"){
        _output=(num1+num2).toString();
      }
      if(operator=="-"){
        _output=(num1-num2).toString();
      }
      if(operator=="/"){
        _output=(num1/num2).toString();
      }
      if(operator=="X"){
        _output=(num1*num2).toString();
      }
      num1=0.0;
      num2=0.0;
      operator="";
    }else{
      _output=_output+buttonText;
    }
    setState((){
      output=double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget buttonT(String t){
    return Expanded(
        child: RaisedButton(
            onPressed: ()=>buttonPressed(t),
            child: Text(t),
            padding: EdgeInsets.all(23),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 23,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(iu,style: TextStyle(fontSize: 41,fontWeight: FontWeight.bold,),),
                    Text(iu2,style: TextStyle(fontSize: 41,fontWeight: FontWeight.bold,),),
                  ],
                ),
                Text(output,style: TextStyle(fontSize: 31,),),

              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Column(
            children: [
              Row(
                children: [
                  buttonT("7"),
                  buttonT("8"),
                  buttonT("9"),
                  buttonT("-"),
                ],
              ),
              Row(
                children: [
                  buttonT("4"),
                  buttonT("5"),
                  buttonT("6"),
                  buttonT("+"),
                ],
              ),
              Row(
                children: [
                  buttonT("3"),
                  buttonT("2"),
                  buttonT("1"),
                  buttonT("/"),
                ],
              ),
              Row(
                children: [
                  buttonT("."),
                  buttonT("0"),
                  buttonT("00"),
                  buttonT("X"),
                ],
              ),
              Row(
                children: [
                  buttonT("CLEAR"),
                  buttonT("="),

                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

