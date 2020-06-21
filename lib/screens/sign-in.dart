import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycruisevideo/screens/instructions.dart';
import 'package:mycruisevideo/widgets/button.dart';
import 'package:mycruisevideo/widgets/input-field.dart';
import 'package:mycruisevideo/widgets/toast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  signInWithEmail(BuildContext context) async {
    ProgressDialog pr = ProgressDialog(context);
    pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    pr.style(
        message: 'Signing in...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: Center(child: CircularProgressIndicator()),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: ScreenUtil().setSp(35), fontWeight: FontWeight.bold)
    );
    try{
      await pr.show();
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      FirebaseUser user = result.user;
      print(user.uid);

      var sub = await Firestore.instance.collection('users').where('email',isEqualTo: email.text).getDocuments();
      var logged = sub.documents;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', user.email);
      prefs.setString('name', logged[0]['name']);
      prefs.setString('phone', logged[0]['phone']);
      await pr.hide();
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context){
        return Instructions();}));
    }
    catch(E){
      print(E);
      await pr.hide();
      ToastBar(color: Colors.red,text: 'Something went Wrong').show();
    }
  }
  
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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                              'Sign In',
                              style: GoogleFonts.piedra(
                                fontSize: ScreenUtil().setSp(50),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(40),ScreenUtil().setWidth(40),ScreenUtil().setWidth(40),0),
                        child: InputField(
                          hint: 'Email',
                          icon: Icons.mail,
                          type: TextInputType.emailAddress,
                          controller: email,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(40),ScreenUtil().setWidth(40),ScreenUtil().setWidth(40),0),
                        child: InputField(
                          hint: 'Password',
                          isPassword: true,
                          icon: Icons.lock,
                          controller: password,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setHeight(50)),
                        child: Button(
                          text: 'Sign in',
                          color: Theme.of(context).primaryColor,
                          onclick: ()=>signInWithEmail(context),
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(30),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
