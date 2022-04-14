import 'package:get/get.dart';
import 'package:translatepracticeapp/pages/result_page.dart';
import 'package:translatepracticeapp/routes/routes_name.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: RoutesName.result_page,
      page: () => ResultPage(),
    )
  ];
}
