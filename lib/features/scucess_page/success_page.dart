import 'package:complaints_application/core/constants/layout/app_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/di/injection_container.dart';
import '../../core/constants/colors/colors.dart';
import '../UnreadNotificationsCount/presentation/bloc/bloc/unread_count_bloc.dart';
import '../UnreadNotificationsCount/presentation/bloc/bloc/unread_count_event.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.armyGreen,
              AppColors.lowGreen,
              AppColors.beige,

              //   AppColors.armyGreen,
              // AppColors.armyGreen2,
              // AppColors.oliveGreen2,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: const Color.fromARGB(255, 120, 172, 123),
              size: 90,
            ),
            AppSpaces.verticalSmall,
            Text(
              textAlign: TextAlign.center,
              'The complaint has been submitted successfully. 🎉',
              style: TextStyle(
                fontSize: 27,
                fontFamily: 'Arima',
                fontWeight: FontWeight.bold,
                color: AppColors.armyGreen,
              ),
            ),
            AppSpaces.verticalSmall,
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton(
                onPressed: () {
                  GoRouter.of(context).pushReplacement('/NavicationBar');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: const Color.fromARGB(255, 120, 172, 123),
                      size: 20,
                    ),
                    AppSpaces.horizontalVerySmall,
                    Text(
                      textAlign: TextAlign.center,
                      'Back To Home',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Arima',
                        fontWeight: FontWeight.w300,
                        color: AppColors.armyGreen2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
