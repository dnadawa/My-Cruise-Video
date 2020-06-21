import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mycruisevideo/screens/image-view.dart';
import 'custom-text.dart';

class Sample extends StatelessWidget {
  final String image;

  const Sample({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(builder: (context){
          return ImageView(image: image,);}));
      },
      child: Column(
        children: <Widget>[
          Hero(
            tag: 'image$image',
            child: Container(
              height: ScreenUtil().setHeight(130),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white,width: 2),
                  image: DecorationImage(image: AssetImage('images/$image'),fit: BoxFit.fill),
                  color: Colors.white
              ),
            ),
          ),
          CustomText(text: 'Sample',color: Colors.black,)
        ],
      ),
    );
  }
}
