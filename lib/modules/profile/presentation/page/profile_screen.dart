import 'package:alternative_code/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/strings.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/my_image.dart';
import '../widget/images_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar:
        MyAppBar(
          title:Get.arguments[0].name ,
        ),

        body: Center(
              child: controller.obx(
             (data) => Column(
                  children: [
                    Hero(
                      tag: 'profile',
                      child: MyImage(
                        url:
                            '${AppStrings.imageBaseUrl}${Get.arguments[0].profilePath}',
                        height: 100,
                        width: 100,
                        originalHeight: MediaQuery.of(context).size.height,
                        originalWidth: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                        boarderRadius: 50,
                        title:Get.arguments[0].name ,

                        canClick: true,
                      ),
                    ),
                    Text(
                      Get.arguments[0].name ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: AppColors.blackColor),
                    ),

                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImagesWidget(
                          images: data!,
                           name: Get.arguments[0].name ?? ''
                        ),
                      ),
                    ),
                  ],
                ),
                onLoading: const CircularProgressIndicator(),
                onEmpty: const Text("don't have Images"),
                onError: ( i) => Text(
                  i.toString(),
                ),
              ),
            )
        );
  }
}
