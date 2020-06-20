import 'package:flutter/material.dart';
import 'custom-text.dart';

class Button extends StatelessWidget {

  final onclick;
  final String text;
  final Color color;
  final bool social;
  final double borderRadius;

  const Button({Key key, this.onclick, this.text, this.color: Colors.black, this.social=false, this.borderRadius=30,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: onclick,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        color: color,
        textColor: Colors.white,
        padding: EdgeInsets.all(15),
        child: CustomText(text: text,size: 18,),
      ),
    );
  }
}