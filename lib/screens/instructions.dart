import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mycruisevideo/screens/upload.dart';
import 'package:mycruisevideo/widgets/button.dart';
import 'package:mycruisevideo/widgets/custom-text.dart';
import 'package:mycruisevideo/widgets/toast.dart';
class Instructions extends StatefulWidget {
  @override
  _InstructionsState createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  String cruise;
  String selectedDate;

  popUpCard(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState){
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.white,
              content: Container(
                height: ScreenUtil().setHeight(500),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CustomText(text: 'Select Your Cruise',color: Colors.black,size: ScreenUtil().setSp(45),),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
                        child: Container(
                          height: ScreenUtil().setHeight(70),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Theme.of(context).accentColor
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                            child: DropdownButton(
                              underline: Divider(color: Theme.of(context).accentColor,height: 0,thickness: 0,),
                              iconEnabledColor: Colors.white,
                              iconDisabledColor: Colors.white,
                              items: <DropdownMenuItem>[
                                DropdownMenuItem(child: CustomText(text:'Symphony of the Seas',color: Colors.white,),value: 'Symphony of the Seas',),
                                DropdownMenuItem(child: CustomText(text:'Harmony of the Seas',color: Colors.white,),value: 'Harmony of the Seas',),
                                DropdownMenuItem(child: CustomText(text:'Ovation of the Seas',color: Colors.white,),value: 'Ovation of the Seas',),
                                DropdownMenuItem(child: CustomText(text:'Anthem of the Seas',color: Colors.white,),value: 'Anthem of the Seas',),
                                DropdownMenuItem(child: CustomText(text:'Quantum of the Seas',color: Colors.white,),value: 'Quantum of the Seas',),
                                DropdownMenuItem(child: CustomText(text:'Allure of the Seas',color: Colors.white,),value: 'Allure of the Seas',),
                                DropdownMenuItem(child: CustomText(text:'Oasis of the Seas',color: Colors.white,),value: 'Oasis of the Seas',),
                                DropdownMenuItem(child: CustomText(text:'Independence of the Seas',color: Colors.white,),value: 'Independence of the Seas',),
                                DropdownMenuItem(child: CustomText(text:'Liberty of the Seas',color: Colors.white,),value: 'Liberty of the Seas',),
                                DropdownMenuItem(child: CustomText(text:'Freedom of the Seas',color: Colors.white,),value: 'Freedom of the Seas',),
                                DropdownMenuItem(child: CustomText(text:'Jewel of the Seas',color: Colors.white,),value: 'Jewel of the Seas',),
                                DropdownMenuItem(child: CustomText(text:'Serenade of the Seas',color: Colors.white,),value: 'Serenade of the Seas',),
                              ],
                              onChanged:(newValue){
                                setState(() {
                                  cruise = newValue;
                                });
                              },
                              value: cruise,
                            ),
                          ),
                        ),
                      ),
                      CustomText(text: 'Departure Date',color: Colors.black,size: ScreenUtil().setSp(45),),
                      SizedBox(height: ScreenUtil().setHeight(30),),
                      GestureDetector(
                        onTap: () async {
                          DateTime picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020, 1),
                              lastDate: DateTime(2101));
                          setState(() {
                            selectedDate = DateFormat('yyyy-MM-dd').format(picked);
                          });
                          },
                        child: Container(
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setHeight(80),
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: CustomText(
                              text: selectedDate==null?'Pick a Date':selectedDate,
                              size: ScreenUtil().setSp(35),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
                        child: Button(
                          color: Theme.of(context).primaryColor,
                          text: 'Confirm',
                          onclick: (){
                            if(selectedDate!=null){
                              Navigator.push(context, CupertinoPageRoute(builder: (context){
                                return Upload();}));
                            }
                            else{
                              ToastBar(text: 'Please pick a date!',color: Colors.red).show();
                            }
                            },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cruise = 'Symphony of the Seas';
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 720, height: 1520, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Instruction',
          style: GoogleFonts.piedra(
            fontSize: ScreenUtil().setSp(50),
            color: Colors.white,
          ),
        ),
      ),

      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              child: Image.asset('images/ship.png',fit: BoxFit.fitWidth,),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(40)),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage('images/gradient.jpg'),fit: BoxFit.fill)
                    //color: Colors.blue
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CustomText(text: 'OUR GOAL IS TO PROVIDE YOU WITH THE BEST PERSONAL VIDEO EXPERIENCE. PLEASE READ TIPS :',align: TextAlign.start,size: ScreenUtil().setSp(32),),
                        SizedBox(height: ScreenUtil().setHeight(30),),
                        CustomText(text: '1. ALWAYS HOLD CAMERA SIDEWAYS.',align: TextAlign.start,isBold: false,size: ScreenUtil().setSp(30),),
                        SizedBox(height: ScreenUtil().setHeight(20),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: ScreenUtil().setWidth(200),
                              height: ScreenUtil().setHeight(200),
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('images/sample1.jpg'),fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                            Container(
                              width: ScreenUtil().setWidth(200),
                              height: ScreenUtil().setHeight(200),
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage('images/sample2.jpg'),fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20),),
                        CustomText(text: '2. REVIEW THE “SAMPLE” PHOTOS',align: TextAlign.start,isBold: false,size: ScreenUtil().setSp(30),),
                        SizedBox(height: ScreenUtil().setHeight(20),),
                        CustomText(text: '3. CONFIRM CORRECT PHOTO FOR EACH CATEGORY',align: TextAlign.start,isBold: false,size: ScreenUtil().setSp(30),),
                        SizedBox(height: ScreenUtil().setHeight(20),),
                        CustomText(text: '4. VIDEO INTRO SHOULD BE 10 SECONDS OR LESS',align: TextAlign.start,isBold: false,size: ScreenUtil().setSp(30),),
                        SizedBox(height: ScreenUtil().setHeight(20),),
                        CustomText(text: '5. ALL PHOTOS SHOULD FOCUS ON YOU, NOT SCENERY',align: TextAlign.start,isBold: false,size: ScreenUtil().setSp(30),),
                        SizedBox(height: ScreenUtil().setHeight(20),),
                        CustomText(text: '6. HAVE FUN !',align: TextAlign.start,isBold: false,),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(40)),
                child: Button(
                  text: 'Next',
                  color: Theme.of(context).primaryColor,
                  onclick: ()=>popUpCard(),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
