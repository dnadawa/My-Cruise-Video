import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycruisevideo/screens/first-page.dart';
import 'package:mycruisevideo/widgets/button.dart';
import 'package:mycruisevideo/widgets/input-field.dart';
import 'package:mycruisevideo/widgets/toast.dart';

class SignUp extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  CollectionReference collectionReference = Firestore.instance.collection('users');

  signUp(BuildContext context) async {
    if(email.text!='' && name.text!='' && phone.text!='' && password.text!='' && confirmPassword.text!=''){
      if(password.text == confirmPassword.text){
        try{
          AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
              email: email.text, password: password.text);
          FirebaseUser user = result.user;
          print(user.uid);

          await collectionReference.document(email.text).setData({
            'name': name.text,
            'email': email.text,
            'phone': phone.text,
          });
          ToastBar(color: Colors.green,text: 'Signed Up Successfully!').show();
          Navigator.push(context, CupertinoPageRoute(builder: (context){
            return FirstPage();}));
        }
        catch(E){
          ToastBar(color: Colors.red,text: 'Something Went Wrong!').show();
          print(E);
        }
      }
      else{
        ToastBar(color: Colors.red,text: 'Password does not match!').show();
      }

    }else{
      ToastBar(color: Colors.red,text: 'Please Fill all the Fields!').show();
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
                              'Sign Up',
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
                          hint: 'Name',
                          icon: Icons.person,
                          controller: name,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(40),ScreenUtil().setWidth(40),ScreenUtil().setWidth(40),0),
                        child: InputField(
                          hint: 'Mobile Number',
                          icon: Icons.phone,
                          type: TextInputType.phone,
                          controller: phone,
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
                          hint: 'Create Password',
                          isPassword: true,
                          icon: Icons.lock,
                          controller: password,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(40)),
                        child: InputField(
                          hint: 'Confirm Password',
                          isPassword: true,
                          icon: Icons.lock,
                          controller: confirmPassword,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setHeight(40)),
                        child: Button(
                          text: 'Submit',
                          color: Theme.of(context).primaryColor,
                          onclick: ()=>signUp(context),
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
