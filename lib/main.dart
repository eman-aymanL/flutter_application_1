import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/data/db_helper/db_helper.dart';
import 'package:flutter_application_1/features/home/data/model/meal_model.dart';
import 'package:flutter_application_1/features/onboarding/screen/onboarding_screen.dart';
import 'package:flutter_application_1/features/spalch/screen/splach_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtilInit, SizeExtension;

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  DatabaseHelper databaseHelper =DatabaseHelper.inistance;
  final meals=await databaseHelper.getMeals();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: false,
    builder: (_ ,  __) {
        return MaterialApp(debugShowCheckedModeBanner: false,home:  const SplachScreen(),);
      },
  // child: SplachScreen()

    );
     
  }
}
