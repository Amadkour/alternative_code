import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'app_bar.dart';
import 'my_image.dart';

class FullScreenImage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      MyAppBar(
        title:Get.arguments[3] ,
        action:  IconButton(
            onPressed: () {
              GallerySaver.saveImage(Get.arguments[0]).then((value) =>
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Image Saved Successfully'),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  )));
            },
            icon: const Icon(
              Icons.save_alt,
              color: Colors.black,
            )),
      ),
      body: Center(
        child: MyImage(
          url: Get.arguments[0],
          height: Get.arguments[2],
          width: Get.arguments[1],
        ),
      ),
    );
  }
}
