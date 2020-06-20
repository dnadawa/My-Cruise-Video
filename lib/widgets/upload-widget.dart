import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mycruisevideo/widgets/toast.dart';
import 'package:path/path.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data.dart';
import 'custom-text.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadWidget extends StatefulWidget {
  final String type;
  final Data data;
  UploadWidget({Key key, this.type, this.data}) : super(key: key);

  @override
  _UploadWidgetState createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  bool uploadComplete = false;


  sendData(String fileUrl){
    if(widget.type=='intro'){
      widget.data.setIntro(url: fileUrl);
    }
    else if(widget.type=='boarding'){
      widget.data.setBoarding(url: fileUrl);
    }
    else if(widget.type=='pool'){
      widget.data.setPool(url: fileUrl);
    }
    else if(widget.type=='excursions'){
      widget.data.setExc(url: fileUrl);
    }
    else if(widget.type=='dining'){
      widget.data.setDining(url: fileUrl);
    }
    else if(widget.type=='casino'){
      widget.data.setCasino(url: fileUrl);
    }
    else if(widget.type=='various'){
      widget.data.setVarious(url: fileUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String email = prefs.getString('email');
        File file;
        if(widget.type=='intro'){
          file = await FilePicker.getFile(type: FileType.custom,allowedExtensions: ['jpg','png','mp4']);
        }
        else{
          file = await FilePicker.getFile(type: FileType.image);
        }


        ProgressDialog pr = ProgressDialog(context);
        pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
        pr.style(
            message: 'Uploading file...',
            borderRadius: 10.0,
            backgroundColor: Colors.white,
            progressWidget: Center(child: CircularProgressIndicator()),
            elevation: 10.0,
            insetAnimCurve: Curves.easeInOut,
            messageTextStyle: TextStyle(
                color: Colors.black, fontSize: ScreenUtil().setSp(35), fontWeight: FontWeight.bold)
        );

        try{
          StorageReference ref = FirebaseStorage.instance.ref().child("${widget.type}/$email/${basename(file.path)}");
          await pr.show();
          StorageUploadTask uploadTask = ref.putFile(file);
          final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
          String fileUrl = (await downloadUrl.ref.getDownloadURL());
          await pr.hide();
          setState(() {
            uploadComplete = true;
          });
        sendData(fileUrl);
        print("url is $fileUrl");
        }
        catch(e){
        print(e);
        ToastBar(text: 'Something went wrong',color: Colors.red).show();
        }
      },
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(130),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black,width: 2),
                color: Colors.white
            ),
            child: Icon(!uploadComplete?Icons.cloud_upload:Icons.check_circle,size: ScreenUtil().setWidth(100),),
          ),
          CustomText(text: 'Upload',color: Colors.black,)
        ],
      ),
    );
  }
}
