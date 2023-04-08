import 'package:flutter/material.dart';
import 'package:food_delivery_app_getx/screens/cartpage.dart';
import 'package:food_delivery_app_getx/screens/homepage.dart';
import 'package:food_delivery_app_getx/screens/splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashPage(),
        ),
        GetPage(
          name: '/HomePage',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/CartPage',
          page: () => const CartPage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    ),
  );
}
