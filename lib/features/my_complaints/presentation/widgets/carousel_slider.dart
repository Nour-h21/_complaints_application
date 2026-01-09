import 'package:flutter/material.dart';

import '../../../../core/constants/colors/colors.dart';

Widget buildCarouselItem(String imagePath, String text) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.oliveGreen.withOpacity(0.5),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.beige,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Arima',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ],
  );
}
