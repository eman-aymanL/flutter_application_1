import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
      backgroundColor: AppColor.titleColor,
      foregroundColor: AppColor.primaryColor,
      shape: CircleBorder(
        side: BorderSide(color: AppColor.primaryColor,width: 2.w)
      ),
      onPressed: () {},
    child: Icon(Icons.add ,color: AppColor.primaryColor,),),      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 230.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/homebg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 15.h,
                left: 36.w,
                child: Container(
                  height: 180.h,
                  width: 190.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48.r),
                    color: AppColor.primaryColor.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      'Welcome \n Add A New \n Recipe',
                      style: TextStyle(
                        color: AppColor.titleColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    'Your Food',
                    style: TextStyle(
                      color: AppColor.descriptionColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 0.75,
                      children: [
                        foodItem(
                          image: 'assets/mealOne.png',
                          title: 'Cheese Burger',
                          rating: '4.8',
                        ),
                        foodItem(
                          image: 'assets/mealTwo.png',
                          title: 'Pizza',
                          rating: '4.5',
                        ),
                        foodItem(
                          image: 'assets/mealThree.png',
                          title: 'Pasta',
                          rating: '4.6',
                        ),
                        foodItem(
                          image: 'assets/mealFour.png',
                          title: 'Chicken Wrap',
                          rating: '4.7',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget foodItem({
    required String image,
    required String title,
    required String rating,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 100.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Icon(Icons.star, color: AppColor.primaryColor, size: 18),
                SizedBox(width: 4.w),
                Text(rating),
              ],
            ),
   
          ],
        ),
      ),
    );
    
  }
}
