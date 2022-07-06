import 'package:flutter/material.dart';

import '../../../../core/widget/app_bar.dart';
import '../../controllers/home_controller.dart';
import '../widget/person_item_design.dart';
import 'package:get/get.dart';
import 'package:loadmore/loadmore.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Populars',
        hasBackButton: false,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: controller.obx(
              (data) => LoadMore(
                isFinish: false,
                onLoadMore: () async {
                  controller.pageNumber.value++;
                  await Future.delayed(
                      const Duration(seconds: 0, milliseconds: 2000));
                  return false;
                },
                textBuilder: DefaultLoadMoreTextBuilder.english,
                child: ListView.separated(
                  controller: ScrollController(
                      keepScrollOffset: false,
                      initialScrollOffset: ((data!.length / 20) - 1) * 1600.0),
                  itemBuilder: (c, i) => PersonItemDesign(
                    person: data[i],
                  ),
                  separatorBuilder: (c, i) => const Divider(
                    height: 10,
                  ),
                  itemCount: data.length,
                ),
              ),
              onLoading: const CircularProgressIndicator(),
              onEmpty: const Text("Don't have Pepole"),
              onError: (i) => Text(
                i.toString(),
              ),
            ),
          )),
    );
  }
}
