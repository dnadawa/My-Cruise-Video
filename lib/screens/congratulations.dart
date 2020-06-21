import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycruisevideo/screens/instructions.dart';
import 'package:mycruisevideo/widgets/button.dart';
import 'package:mycruisevideo/widgets/custom-text.dart';

class Congratulations extends StatelessWidget {
  final String orderId;

  const Congratulations({Key key, this.orderId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 720, height: 1520, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: ScreenUtil.statusBarHeight,
            color: Theme.of(context).primaryColor,
          ),
          Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(150),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/gradient.jpg'),fit: BoxFit.fill)
            ),
            child: Center(
              child: CustomText(
                text: 'CONGRATULATIONS',
                size: ScreenUtil().setSp(60),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(120)),
            child: Container(
                width: ScreenUtil().setWidth(500),
                height: ScreenUtil().setHeight(500),
                child: Image.asset('images/gift.png',fit: BoxFit.contain,)
            ),
          ),
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setHeight(40)),
            child: Text(
              'YOUR PERSONALIZED VIDEO WILL BE SENT TO YOU WITHIN FIVE (5) BUSINESS DAYS.',
            style: GoogleFonts.sriracha(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(50),
              height: 1.2
            ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setHeight(40)),
            child: Button(
              text: 'Go to Home',
              color: Theme.of(context).primaryColor,
              onclick: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context){
                    return Instructions();}));
                },
            ),
          )
        ],
      ),
    );
  }
}
