import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),

    );
    
  }
}


class JankenPage extends StatefulWidget {
  const JankenPage({Key? key}) : super(key: key);

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {

  String myHand = '✊';
  String computerHand = '✊';
  String result = 'あいこ';

  void selectHand(String selectedHand){
    myHand = selectedHand;
    generateComputerHand();
    judge();
    setState(() {});

  }

  void generateComputerHand(){
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
    //print(randomNumberToHand(randomNumber));
  }

  String randomNumberToHand(int randomNumber){
    switch(randomNumber){
      case 0: return '✊';
      case 1: return '✌️';
      case 2: return '🖐️';
      default: return '✊';
    }

  }


  void judge (){
    if (myHand == computerHand){
      result = 'あいこ';
    }
    else if (myHand == '✊' && computerHand == '✌️'){
      result = '勝ち';
    }
    else if (myHand == '✌️' && computerHand == '🖐️'){
      result = '勝ち';
    }
    else if (myHand == '🖐️' && computerHand == '✊'){
      result = '勝ち';
    }
    else {
      result = '負け';
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),

      ),
      body: Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(result,
          style: TextStyle(fontSize: 64),),
          SizedBox(height: 64,),
          Text(computerHand,
          style: TextStyle(fontSize: 64),),
          SizedBox(height: 64,),
          Text(myHand,
          style: TextStyle(fontSize: 32),),
          SizedBox(height: 32,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  selectHand('✊');
                },
                child: const Text('✊'),),
              ElevatedButton(
              onPressed: (){
                  selectHand('✌️');
              },
              child: const Text('✌️'),),
              ElevatedButton(
              onPressed: (){
                  selectHand('🖐️');
              },
              child: const Text('✋'),),
            ],
          ),
        ],
      ),
      )
    );
  }
}