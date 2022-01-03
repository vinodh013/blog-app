import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/round_button.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({ Key? key }) : super(key: key);

  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Image(image: AssetImage('images/firebase.png')),
              SizedBox(height: 30,),
              RoundButton(Title: 'login', onPress: (){} ),
              SizedBox(height: 20,),
              RoundButton(Title: 'Register', onPress: (){})
            ],
          ),
        ),
      ),
      
    );
  }
}