import 'package:alternative_code/modules/home/providers/rep/home_repo.dart';
import 'package:get/get.dart';

import '../providers/model/Person_model.dart';


class HomeController extends GetxController with StateMixin<List<PersonModel>> {
  RxInt pageNumber = 1.obs;

  @override
  void onInit() {
    super.onInit();
    HomeRepo().fetchData(pageNumber.value).then((value) => change(value,
        status: value.isNotEmpty ? RxStatus.success() : RxStatus.empty()));
  }
}
