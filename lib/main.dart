import 'package:alternative_code/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/them.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Popular App',
    theme: appTheme,
    initialRoute: AppPages.init,
    getPages: AppPages.routes,
  ),);
}

