import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/core/values/app_colors/all_colors_export.dart';


customSnackBar(String? message,{Color backGroundColor = AppColors.appPrimaryColorDark}) {
  return ScaffoldMessenger.of(Get.context!)..removeCurrentSnackBar()..showSnackBar(
    SnackBar(
      backgroundColor: backGroundColor,
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating, // Makes it appear floating
      margin: EdgeInsets.only(
        top: 10.0, // Position from the top
        left: 10.0,
        right: 10.0,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(Get.context!).size.width - 100,
            child: Text(message.toString(), maxLines: 2,),
          ),
        ],
      ),
    ),
  );
}