import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class ImageView extends StatelessWidget {
  final String image;

  const ImageView({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Center(
          child: Hero(
              tag: 'image$image',
              child: PhotoView(
                imageProvider: AssetImage('images/$image'),
              )
          )
      ),
    );
  }

}
