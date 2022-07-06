
import 'package:alternative_code/modules/home/presentation/page/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';

import '../core/widget/full_screen_image.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/presentation/page/profile_screen.dart';
part 'app_routes.dart';

class AppPages {
  static const init = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.fullScreen,
      page: () => FullScreenImage(),
    ),
  ];
}
