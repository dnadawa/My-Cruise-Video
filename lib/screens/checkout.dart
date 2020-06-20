import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:mycruisevideo/widgets/button.dart';
import 'package:mycruisevideo/widgets/custom-text.dart';
import 'package:mycruisevideo/widgets/toast.dart';

import 'package:stripe_payment/stripe_payment.dart';

class Checkout extends StatefulWidget {
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

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: "pk_test_ceYbOP9J1CQYcPFFUYzzgZO300PCZvWMI6",
        androidPayMode: 'test',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/back.png'),fit: BoxFit.fill)
        ),

        child: SingleChildScrollView(
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
                        padding:  EdgeInsets.all(ScreenUtil().setHeight(20)),
                        child: CustomText(
                          text: 'I, hereby grant permission to My Cruise Video to use or reproduce any portion of the photo images provided through the current app that have been taken by myself or someone I designated '
                              'for the purpose of a personalized video and or publications which can include but is not limited to, books, cards, calendars, invitations and websites without any more compensation or '
                              'recognition given to me. Furthermore, I grant creative permission to alter the photograph(s) or video’. I do not grant permission to resale or use the photographs in a manner that would '
                              'exploit or cause malicious representation toward me or my company and associates.',
                          align: TextAlign.left,
                          size: ScreenUtil().setSp(32),
                        ),
                      ),
                    ],
                  ),
                ),
              ),



//            Align(
//                alignment: Alignment.bottomCenter,
//                child: Button(text: 'Pay',onclick: (){
//                  ToastBar(text: 'Please wait',color: Colors.orange).show();
//
//                  try{
//                    final CreditCard testCard = CreditCard(
//                      number: cardNumber,
//                      expMonth: int.parse(expiryDate[0]+expiryDate[1]),
//                      expYear: int.parse(expiryDate[3]+expiryDate[4]),
//                      cvc: cvvCode,
//                    );
//
//                    //print(int.parse(expiryDate[3]+expiryDate[4]));
//                    StripePayment.createTokenWithCard(
//                      testCard,
//                    ).then((token) async {
//                      try{
//                        var response = await http.post('https://api.stripe.com/v1/charges',
//                          body: {'amount': '7900','currency': 'usd',"source": token.tokenId},
//                          headers: {'Authorization': "Bearer sk_test_NxydE0BKuePH2kP6BV0MCc2200J0phDPbk"},
//                        );
//                        print('Response status: ${response.statusCode}');
//                        print('Response body: ${response.body}');
//
//                        if(response.statusCode == 200){
//                          await ToastBar(text: 'Payment Completed!',color: Colors.green).show();
//
//                          ToastBar(text: 'Data Uploaded!',color: Colors.green).show();
//
//                        }
//                        else{
//                          ToastBar(text: 'Something went Wrong While Processing the Payment',color: Colors.red).show();
//                        }
//                      }
//                      catch(e){
//                        ToastBar(text: 'Something went Wrong While Processing the Payment',color: Colors.red).show();
//                      }
//                    });
//                  }
//                  catch(e){
//                    ToastBar(text: 'Something went Wrong While Processing the Payment',color: Colors.red).show();
//                  }
//                },)),
            ],
          ),
        ),

      ),

    );
  }
}
