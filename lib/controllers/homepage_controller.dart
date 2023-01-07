import 'package:get/get.dart';
import 'package:si_coder/core/constant/routes/app_routes.dart';

class HomePageController extends GetxController {
  navToClient() {
    Get.toNamed(AppRoute.clientpage);
  }

// !
  navToAdherent() {
    Get.toNamed(AppRoute.adherentpage);
  }
}
