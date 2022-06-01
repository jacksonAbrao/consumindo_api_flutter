import 'package:consumindo_api/home/http/http_bindings.dart';
import 'package:consumindo_api/home/http/http_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:consumindo_api/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          children: [
            GetPage(
              name: '/http',
              page: () => const HttpPage(),
              binding: HttpBindings(),
            ),
          ],
        ),
      ],
    );
  }
}
