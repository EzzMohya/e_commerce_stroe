import 'package:e_commerce_app/bindngs/inialBinding.dart';
import 'package:e_commerce_app/core/localization/LocalContorller.dart';
import 'package:e_commerce_app/core/localization/translation.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
              displayLarge:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          fontFamily: GoogleFonts.roboto.toString()),
      getPages: routes,
      initialBinding: InialBinding(),
      locale: controller.language,
      translations: MyLanguage(),
    );
  }
}
