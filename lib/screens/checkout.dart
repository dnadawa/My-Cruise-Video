import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:mycruisevideo/screens/congratulations.dart';
import 'package:mycruisevideo/widgets/button.dart';
import 'package:mycruisevideo/widgets/custom-text.dart';
import 'package:mycruisevideo/widgets/toast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stripe_payment/stripe_payment.dart';

class Checkout extends StatefulWidget {
  final String intro;
  final String boarding;
  final List<String> pool;
  final List<String> exc;
  final List<String> dining;
  final List<String> casino;
  final List<String> various;

  const Checkout({Key key, this.intro, this.boarding, this.pool, this.exc, this.dining, this.casino, this.various}) : super(key: key);
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String cardNumber ='';
  String expiryDate='';
  String cardHolderName='';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool isSelected = false;
  int r;
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
  checkAvailiability(ProgressDialog pr) async {
    Random rnd = Random();
    r = 10000 + rnd.nextInt(99999 - 10000);
    var x = await Firestore.instance.collection('orders').where('code', isEqualTo: r.toString()).getDocuments();
    var availiable = x.documents;
    if(availiable.isEmpty){
      sendToFirestore(r.toString(),pr);
    }
    else{
      checkAvailiability(pr);
    }
  }
  sendToFirestore(String code, ProgressDialog pr) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString('email');
      String name = prefs.getString('name');
      String phone = prefs.getString('phone');
      String cruise = prefs.getString('cruise');
      String departure = prefs.getString('departure');

      Firestore.instance.collection('orders').document(code).setData({
        'id': code,
        'email': email,
        'name': name,
        'phone': phone,
        'cruise': cruise,
        'departure': departure,
        'intro': widget.intro,
        'boarding': widget.boarding,
        'pool': widget.pool,
        'excursions': widget.exc,
        'dining': widget.dining,
        'casino': widget.casino,
        'various': widget.various,
      });
      await pr.hide();
      Navigator.push(context, CupertinoPageRoute(builder: (context){
        return Congratulations(orderId: code,);}));
    }
    catch(e){
      await pr.hide();
      ToastBar(text: 'Something Went Wrong While Uploading Data!',color: Colors.red).show();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: "pk_live_51GuszQHB6NrjKlv6sL1Ht7tF4R4HeBzTldmHxQsJ2waXkcOdSv2uj6HRymqp7PEZEadDfKidZMSFD7qRMf4POO0M00Desva5Zr",
        androidPayMode: 'live',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ProgressDialog pr = ProgressDialog(context);
    pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    pr.style(
        message: 'Please wait...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: Center(child: CircularProgressIndicator()),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: ScreenUtil().setSp(35), fontWeight: FontWeight.bold)
    );
    ScreenUtil.init(width: 720, height: 1520,allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Checkout',
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
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              cardBgColor: Theme.of(context).primaryColor,
            ),
            CreditCardForm(
              textColor: Colors.black,
              themeColor: Colors.black,
              cardHolderName: cardHolderName,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              onCreditCardModelChange: onCreditCardModelChange,
            ),
            Padding(
              padding:  EdgeInsets.all(ScreenUtil().setHeight(40)),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage('images/gradient.jpg'))
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: ScreenUtil().setHeight(100),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Theme.of(context).primaryColor,width: 4)
                      ),
                      child: Center(child: CustomText(text: 'AGREEMENT',color: Colors.black,size: ScreenUtil().setSp(45),)),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(ScreenUtil().setHeight(30)),
                      child: CustomText(
                        text: 'I, hereby grant permission to My Cruise Video to use or reproduce any portion of the photo images provided through the current app that have been taken by myself or someone I designated '
                            'for the purpose of a personalized video and or publications which can include but is not limited to, books, cards, calendars, invitations and websites without any more compensation or '
                            'recognition given to me. Furthermore, I grant creative permission to alter the photograph(s) or video’. I do not grant permission to resale or use the photographs in a manner that would '
                            'exploit or cause malicious representation toward me or my company and associates.',
                        isBold: false,
                        align: TextAlign.left,
                        size: ScreenUtil().setSp(32),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: ScreenUtil().setWidth(20)),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: isSelected,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (value) {
                      setState(() {
                        isSelected = value;
                      });},
                  ),
                  CustomText(text: 'AGREE',color: Colors.black,),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setHeight(50)),
              child: Button(
                text: 'Pay',
                color: Theme.of(context).primaryColor,
                onclick: () async {
                  if(isSelected){
                    await pr.show();
                    try{
                      final CreditCard testCard = CreditCard(
                        number: cardNumber,
                        expMonth: int.parse(expiryDate[0]+expiryDate[1]),
                        expYear: int.parse(expiryDate[3]+expiryDate[4]),
                        cvc: cvvCode,
                      );
                      StripePayment.createTokenWithCard(
                        testCard,
                      ).then((token) async {
                        try{
                          var response = await http.post('https://api.stripe.com/v1/charges',
                            body: {'amount': '7900','currency': 'usd',"source": token.tokenId},
                            headers: {'Authorization': "Bearer sk_live_J48O1vc4BIoT38BHzxcbftss00D0hk0YOe"},
                          );
                          print('Response status: ${response.statusCode}');
                          print('Response body: ${response.body}');

                          if(response.statusCode == 200){
                            checkAvailiability(pr);
                            await ToastBar(text: 'Payment Completed!',color: Colors.green).show();
                          }
                          else{
                            await pr.hide();
                            ToastBar(text: 'Something went Wrong While Processing the Payment',color: Colors.red).show();
                          }
                        }
                        catch(e){
                          await pr.hide();
                          ToastBar(text: 'Something went Wrong While Processing the Payment',color: Colors.red).show();
                        }
                      });
                    }
                    catch(e){
                      await pr.hide();
                      ToastBar(text: 'Something went Wrong While Processing the Payment',color: Colors.red).show();
                    }
                  }
                  else{
                    ToastBar(text: 'You should agree to the agreement to continue!',color: Colors.red).show();
                  }
              },),
            ),
          ],
        ),
      ),

    );
  }
}
