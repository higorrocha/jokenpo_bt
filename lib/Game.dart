import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  var _imageApp = AssetImage("images/default.png");
  var _message = "Make Your Choice";

  void _optionSelected(String choiceUser){

    var option = ["paper", "rock", "scissors"];
    var number = Random().nextInt(option.length);
    var choiceApp = option[number];

    //Show the image chosen by the App
    switch(choiceApp){
      case "paper":
        setState(() {
          this._imageApp = AssetImage("images/paper.png");
        });
        break;
      case "rock":
        setState(() {
          this._imageApp = AssetImage("images/rock.png");
        });
        break;
      case "scissors":
        setState(() {
          this._imageApp = AssetImage("images/scissors.png");
        });
        break;
    }

    //Validation of who won the game
    if(
    //User win if
      (choiceUser == "rock" && choiceApp == "scissors") ||
      (choiceUser == "scissors" && choiceApp == "paper") ||
      (choiceUser == "paper" && choiceApp == "rock")
    ){
      setState(() {
        this._message = "Congratulations !*_*! You WIN!";
      });
    }else if(
    //App win if
      (choiceApp == "rock" && choiceUser == "scissors") ||
      (choiceApp == "scissors" && choiceUser == "paper") ||
      (choiceApp == "paper" && choiceUser == "rock")
    ){
      setState(() {
        this._message = "You Lose! :/";
      });
    }else{
      setState(() {
        this._message = "You Tied. Try Play Again. :)";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JOKENPO"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Choice of App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imageApp),
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _optionSelected("paper"),
                child: Image.asset("images/paper.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _optionSelected("rock") ,
                child: Image.asset("images/rock.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _optionSelected("scissors"),
                child: Image.asset("images/scissors.png", height: 100,),
              )
              /*
              Image.asset("images/paper.png", height: 100),
              Image.asset("images/rock.png", height: 100),
              Image.asset("images/scissors.png", height: 100)
              */
            ],
          )
        ],
      ),
    );
  }
}
