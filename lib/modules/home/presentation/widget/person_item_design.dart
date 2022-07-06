import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/strings.dart';
import '../../../../core/widget/my_image.dart';
import '../../../../routes/app_pages.dart';
import '../../providers/model/Person_model.dart';

class PersonItemDesign extends StatelessWidget {
  final PersonModel person;

  const PersonItemDesign({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       Get.toNamed(Routes.profile, arguments: [person]);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: MyImage(
              url: '${AppStrings.imageBaseUrl}${person.profilePath}',
              height: 70,
              width: 70,
              originalHeight: MediaQuery.of(context).size.height,
              originalWidth: MediaQuery.of(context).size.width,
              title: person.name!,
              canClick: true,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  person.name ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: AppColors.blackColor),
                ),
                Text(
                  person.knownForDepartment ?? '',
                  style:
                  Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: AppColors.darkGreyColor,fontSize: 16,),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}
