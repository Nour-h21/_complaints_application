import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/colors/colors.dart';

Widget buildBackButton(BuildContext context) {
      if (Theme.of(context).platform == TargetPlatform.iOS) {
        return CupertinoButton(
          onPressed: () {
            GoRouter.of(context).push('/MyComplaints');
          },
          child: Icon(Icons.arrow_back_ios, color: AppColors.beige),
        );
      }

      return IconButton(
        onPressed: () {
          GoRouter.of(context).push('/MyComplaints');
        },
        icon: Icon(Icons.arrow_back, color: AppColors.beige),
      );
    }