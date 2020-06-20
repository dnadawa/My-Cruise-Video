import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycruisevideo/screens/sign-in.dart';
import 'package:mycruisevideo/screens/sign-up.dart';
import 'package:mycruisevideo/widgets/button.dart';


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 720, height: 1520, allowFontScaling: false);
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('images/back.jpg',fit: BoxFit.fill,),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
                child: Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(900),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(205),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('images/cardback.png'),fit: BoxFit.fill),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(40)),
                            child: Text(
                              'My Cruise Video',
                              style: GoogleFonts.piedra(
                                fontSize: ScreenUtil().setSp(50),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(100),),
                      Padding(
                        padding:  EdgeInsets.all(ScreenUtil().setHeight(60)),
                        child: Button(
                          text: 'Sign Up',
                          onclick: (){
                            Navigator.push(context, CupertinoPageRoute(builder: (context){
                              return SignUp();}));
                          },
                          color: Theme.of(context).primaryColor,
                          borderRadius: 10,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(ScreenUtil().setHeight(60)),
                        child: Button(
                          text: 'Sign In',
                          onclick: (){
                            Navigator.push(context, CupertinoPageRoute(builder: (context){
                              return SignIn();}));
                          },
                          color: Theme.of(context).primaryColor,
                          borderRadius: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
