import 'package:carousel_slider/carousel_slider.dart' show CarouselOptions, CarouselSlider, CarouselSliderController;
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_color.dart';
import 'package:flutter_application_1/features/home/screen/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboadingScreen extends StatefulWidget {
  const OnboadingScreen({super.key});

  @override
  State<OnboadingScreen> createState() => _OnboadingScreenState();
}

class _OnboadingScreenState extends State<OnboadingScreen> {

  List<String> titles = [
    'amor Save Your\n Meals\n Ingredient',
    'Use Our App\n The Best\n Choice',
    'Our App\n Your Ultimate\n Choice'
  ];

  List<String> descriptions = [
    'Add Your Meals and its Ingredients and we will save it for you',
    'the best choice for your kitchen do not hesitate',
    'All the best restaurants and their top menus are ready for you'
  ];

  double currentPage = 0;
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 40.h,
            left: 36.2.w,
            right: 36.2.w,
            child: Container(
              height: 400.h,
              width: 320.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: AppColor.primaryColor.withOpacity(0.85),
              ),
              child: CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                  height: 350.h,
                  viewportFraction: 1.0,
                  onPageChanged: (index, _) {
                    setState(() {
                      currentPage = index.toDouble();
                    });
                  },
                ),
                items: List.generate(titles.length, (index) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          Text(
                            titles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32.sp, 
                              color: AppColor.titleColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            descriptions[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp, 
                              color: AppColor.titleColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 25.h),
                          DotsIndicator(
                            onTap: (index) {
                              controller.animateToPage(index);
                            },
                            dotsCount: titles.length,
                            position: currentPage,
                            decorator: DotsDecorator(
                              size: Size(24.w, 8.h),
                              activeSize: Size(24.w, 8.h),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r)
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r)
                              ),
                              color: AppColor.dotColor, 
                              activeColor: AppColor.titleColor,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 36.sp),
                            child: currentPage == 2 
                              ? CircleAvatar(
                                  backgroundColor: AppColor.titleColor,
                                  radius: 30.r,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomeScreen())
                                      );
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ) 
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                                        await prefs.setBool('seen', true);
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return HomeScreen(); 
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(), 
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (currentPage < 2) {
                                          setState(() {
                                            currentPage++;
                                          });
                                          controller.nextPage();
                                        }
                                      },
                                      child: Text(
                                        'Next',
                                        style: TextStyle(
                                          color: AppColor.titleColor,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          ),
                        ],
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
