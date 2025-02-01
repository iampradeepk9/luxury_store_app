import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pradeep_store_app/routes/app_routes.dart';
import 'bindings/initial_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}