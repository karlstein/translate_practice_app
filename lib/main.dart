import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translatepracticeapp/routes/page_routes.dart';
import 'package:translatepracticeapp/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.result_page,
      getPages: PageRoutes.pages,
    );
  }
}
