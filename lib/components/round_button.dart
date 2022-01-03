import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String Title;
  final VoidCallback onPress;
  RoundButton({required this.Title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        color: Colors.deepOrange,
        height: 50,
        minWidth: double.infinity,
        child: Text(Title, style: TextStyle(color: Colors.white),),
        onPressed: onPress,
      ),
    );
  }
}
