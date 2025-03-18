import 'package:flutter/material.dart';

import '../values/app_colors/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color? color;
  const CustomCircularProgressIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppColors.whiteOnly,
        strokeWidth: 2,
      ),
    );
  }
}
