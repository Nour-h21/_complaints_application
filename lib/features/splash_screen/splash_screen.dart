import 'dart:async';

import 'package:complaints_application/core/constants/urls/assets_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../app/di/injection_container.dart';
import '../../core/constants/colors/colors.dart';
import '../../core/services/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late final StorageService storageService;
  

  // @override
  // void initState() {
  //   super.initState();

  //   _controller = AnimationController(
  //     duration: const Duration(milliseconds: 1500),
  //     vsync: this,
  //   );

  //   _scaleAnimation = TweenSequence<double>([
  //     TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.1), weight: 50),
  //     TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 50),
  //   ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  //   _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
  //     CurvedAnimation(
  //       parent: _controller,
  //       curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
  //     ),
  //   );

  //   _controller.forward();

  //   Future.delayed(const Duration(seconds: 4), () {
  //     GoRouter.of(context).go('/Onboarding');
  //   });
  // }


  @override
  void initState() {
    super.initState();
    storageService = getIt<StorageService>();

    // Animations
    _controller = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.1), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0)),
    );
    _controller.forward();

    navigateAfterSplash();
  }

  // Future<void> navigateAfterSplash() async {
  //   await Future.delayed(const Duration(seconds: 3)); // مدة السبلاتش

  //   if (!mounted) return;

  //   if (storageService.isFirstLaunch) {
  //     // أول مرة → Onboarding
  //     GoRouter.of(context).go('/Onboarding');
  //     await storageService.setFirstLaunchDone(); // حفظ أن المستخدم شاف onboarding
  //   } else {
  //     // مش أول مرة → Auth أو Home
  //     if (storageService.isLoggedIn) {
        
  //       GoRouter.of(context).go('/NavicationBar'); // Home
  //     } else {
  //       GoRouter.of(context).go('/register'); // Auth
  //     }
  //   }
  // }

  Future<void> navigateAfterSplash() async {
  await Future.delayed(const Duration(seconds: 3));

  if (!mounted) return;

  if (storageService.isFirstLaunch) {
    GoRouter.of(context).go('/Onboarding');
    await storageService.setFirstLaunchDone();
  } else if (!storageService.isLoggedIn) {
    GoRouter.of(context).go('/register'); // لا مستخدم → register
  } else {
    GoRouter.of(context).go('/NavicationBar'); // مستخدم موجود → Home
  }
}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // AppColors.lowGreen,
              // AppColors.offWhite,

              //  AppColors.armyGreen,
              //    AppColors.lowGreen,
              //    AppColors.beige,
              AppColors.armyGreen,
              AppColors.armyGreen2,
              AppColors.oliveGreen2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 155),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(AppAssets.logoWitBackground),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.armyGreen,
                            blurRadius: 50,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - _fadeAnimation.value)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'S',
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: AppColors.oliveGreen,
                              fontFamily: 'Arima',
                            ),
                          ),
                          Text(
                            'hakwa \n yr',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.beige,
                              fontFamily: 'Arima',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
