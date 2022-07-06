import 'package:get/get.dart';

import '../providers/model/details_model.dart';
import '../providers/rep/profile_repo.dart';


class ProfileController extends GetxController with StateMixin<List<DetailsModel>> {
  RxString personId = '0'.obs;

  @override
  void onInit() {
    personId.value=Get.arguments[0].id;
    super.onInit();
    MyProfileRepo().fetchData(personId.value).then((value) => change(value,
        status: value.isNotEmpty ? RxStatus.success() : RxStatus.empty()));
  }
}
