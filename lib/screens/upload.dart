import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycruisevideo/screens/checkout.dart';
import 'package:mycruisevideo/widgets/button.dart';
import 'package:mycruisevideo/widgets/custom-text.dart';
import 'package:mycruisevideo/widgets/sample.dart';
import 'package:mycruisevideo/widgets/upload-widget.dart';

import '../data.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  bool upload = false;
  Data data = Data();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 720, height: 1520, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Upload',
          style: GoogleFonts.piedra(
            fontSize: ScreenUtil().setSp(50),
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage('images/gradient.jpg'),fit: BoxFit.fill)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                        child: CustomText(text: 'INTRO - 1 PHOTO OR VIDEO',size: ScreenUtil().setSp(30),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Sample(image: 'intro.png',)),
                            SizedBox(width: ScreenUtil().setWidth(15),),
                            Expanded(
                              child: UploadWidget(type: 'intro',data: data,),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(15),),
                            Expanded(child: SizedBox.shrink())
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setWidth(25),),
                    ],
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage('images/gradient.jpg'),fit: BoxFit.fill)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: CustomText(text: 'BOARDING - 1 PHOTO',size: ScreenUtil().setSp(30),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Sample(image: 'boarding.png',)),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'boarding',data: data,),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(child: SizedBox.shrink())
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(25),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage('images/gradient.jpg'),fit: BoxFit.fill)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: CustomText(text: 'POOL/DECK - ACTIVITIES - 2 PHOTOS',size: ScreenUtil().setSp(30),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Sample(image: 'pool.png',)),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'pool',data: data,),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'pool',data: data,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(25),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage('images/gradient.jpg'),fit: BoxFit.fill)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: CustomText(text: 'EXCURSIONS - 3-5 PHOTOS',size: ScreenUtil().setSp(30),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Sample(image: 'excursion.png',)),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'excursions',data: data,),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'excursions',data: data,),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: UploadWidget(type: 'excursions',data: data,),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'excursions',data: data,),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'excursions',data: data,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(25),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage('images/gradient.jpg'),fit: BoxFit.fill)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: CustomText(text: 'DINING - 1-2 PHOTOS',size: ScreenUtil().setSp(30),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Sample(image: 'dining.png',)),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'dining',data: data,),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'dining',data: data,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(25),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage('images/gradient.jpg'),fit: BoxFit.fill)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: CustomText(text: 'CASINO - 1-2 PHOTOS',size: ScreenUtil().setSp(30),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Sample(image: 'casino.png',)),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'casino',data: data,),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'casino',data: data,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(25),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),ScreenUtil().setHeight(20),0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage('images/gradient.jpg'),fit: BoxFit.fill)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: CustomText(text: 'VARIOUS - 3 PHOTOS',size: ScreenUtil().setSp(30),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: UploadWidget(type: 'various',data: data,),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'various',data: data,),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(15),),
                          Expanded(
                            child: UploadWidget(type: 'various',data: data,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(25),),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(ScreenUtil().setWidth(80)),
              child: Button(
                text: 'Next',
                onclick: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context){
                    return Checkout();}));
                },
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
