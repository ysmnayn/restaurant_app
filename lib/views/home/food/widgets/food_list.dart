import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/common/background_container.dart';
import 'package:restaurant_foodly/common/reusable_text.dart';
import 'package:restaurant_foodly/constants/constants.dart';
import 'package:restaurant_foodly/constants/uidata.dart';
import 'package:restaurant_foodly/views/home/food/widgets/food_tile.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        backgroundColor: kSecondary,
        title: ReusableText(
          text: "Food List",
          style: appStyle(18, kLightWhite, FontWeight.w600),
        ),
      ),
      body: BackGroundContainer(
        child : Padding(
          padding: EdgeInsets.only(top: 20.h),
        child: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (context, i) {
            final food = foods[i];
            return FoodTitle(food: food,);
          },
        ),),
        
      ),
    );
  }
}