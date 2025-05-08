import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/common/custom_button.dart';
import 'package:restaurant_foodly/common/custom_textfield.dart';
import 'package:restaurant_foodly/common/reusable_text.dart';
import 'package:restaurant_foodly/constants/constants.dart';
import 'package:restaurant_foodly/controllers/food_controller.dart';

class FoodInfo extends StatelessWidget {
  const FoodInfo({
    super.key,
    required this.back,
    required this.next,
    required this.title,
    required this.description,
    required this.price,
    required this.preparation,
    required this.types,
  });

  final Function back;
  final Function next;
  final TextEditingController title;
  final TextEditingController description;
  final TextEditingController price;
  final TextEditingController preparation;
  final TextEditingController types;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
    return SizedBox(
      height: height,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Add Details",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text: "You are required to fill the information correctly",
                  style: appStyle(11, kGray, FontWeight.normal),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextfield(
                  controller: title,
                  hintText: "Title",
                  prefixIcon: const Icon(Icons.keyboard_capslock),
                ),
                SizedBox(height: 15.h),
                CustomTextfield(
                  controller: description,
                  hintText: "Add food description",
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  prefixIcon: const Icon(Icons.keyboard_capslock),
                ),
                SizedBox(height: 15.h),
                CustomTextfield(
                  controller: preparation,
                  hintText: "food preparation time e.g 10 min",
                  prefixIcon: const Icon(Icons.money),
                ),
                SizedBox(height: 15.h),
                CustomTextfield(
                  controller: price,
                  hintText: "Price with no currency e.g 100",
                  keyboardType: TextInputType.number,
                  prefixIcon: const Icon(Icons.keyboard_capslock),
                ),
                SizedBox(height: 15.h),
                CustomTextfield(
                  controller: title,
                  hintText: "Title",
                  prefixIcon: const Icon(Icons.keyboard_capslock),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Add Food Types",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text: "You are required to types helps with food search ",
                  style: appStyle(11, kGray, FontWeight.normal),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Obx(
              () => Column(
                children: [
                  CustomTextfield(
                    controller: types,
                    hintText: "Breakfirst / Lunch / Dinner / Snacks / Drinks",
                    prefixIcon: const Icon(Icons.keyboard_capslock),
                  ),
                  SizedBox(height: 15.h),

                  controller.types.isNotEmpty
                      ? Row(
                        children: List.generate(controller.types.length, (i) {
                          return Container(
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                              color: kPrimary,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.h),
                                child: ReusableText(
                                  text: controller.types[i],
                                  style: appStyle(
                                    9,
                                    kLightWhite,
                                    FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                      : const SizedBox.shrink(),
                  SizedBox(height: 15.h),

                  CustomButton(
                    text: "Add Food types",
                    btnColor: kSecondary,
                    onTap: () {
                      controller.setTypes = types.text;
                      types.text = "";
                    },
                    btnRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: "Back",
                  btnWidth: width / 2.3,
                  btnRadius: 6,
                  onTap: () {
                    back();
                  },
                ),
                CustomButton(
                  text: "Next",
                  btnWidth: width / 2.3,
                  btnRadius: 9,
                  onTap: () {
                    next();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}