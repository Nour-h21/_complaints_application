import 'package:complaints_application/features/signup/presentation/pages/signup.dart';
import 'package:complaints_application/features/verification_code/presentation/pages/verification_code.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/login/presentation/pages/login.dart';

final GoRouter router = GoRouter(
  initialLocation: '/register',
  routes: [
    
    GoRoute(
      path: '/register',
      builder: (context, state) => Directionality(
        textDirection: TextDirection.rtl,
        child: Signup(),
      ),
    ),

    GoRoute(
      path: '/logIn',
      builder: (context, state) => Directionality(
        textDirection: TextDirection.rtl,
        child: Login(),
      ),
    ),

     GoRoute(
      path: '/verification_code',
      builder: (context, state) => Directionality(
        textDirection: TextDirection.rtl,
        child: VerificationCode(),
      ),
      
    ),
    GoRoute(
      path: '/verification_code',
      builder: (context, state) => Directionality(
        textDirection: TextDirection.rtl,
        child: VerificationCode(),
      ),
      
    ),
  ]
  );