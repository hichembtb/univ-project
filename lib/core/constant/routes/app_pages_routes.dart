import 'package:get/get.dart';
import 'package:si_coder/views/screens/adherent/adherent_page.dart';
import 'package:si_coder/views/screens/adherent/adherent_result.dart';
import 'package:si_coder/views/screens/client/client_page.dart';
import 'package:si_coder/views/screens/client/client_result.dart';
import '../../../views/screens/home_page.dart';
import 'app_routes.dart';

List<GetPage<dynamic>>? getPages = [
  // ? Home
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),

  // ! client
  GetPage(name: AppRoute.clientpage, page: () => const ClientPage()),
  GetPage(name: AppRoute.clientresult, page: () => const ClientResult()),

  // ! Adherent
  GetPage(name: AppRoute.adherentpage, page: () => const AdherentPage()),
  GetPage(name: AppRoute.adherentresult, page: () => const AdherentResult()),
];
