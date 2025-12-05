import 'package:complaints_application/features/signup/presentation/pages/signup.dart';
import 'package:complaints_application/features/verification_code/presentation/pages/verification_code.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/signup/presentation/bloc/signup_bloc.dart';
import '../../features/verification_code/resend_otp/presentation/bloc/resendotp_bloc/resend_otp_bloc.dart';
import '../../features/verification_code/verify_otp/presentation/bloc/verifyotp_bloc/otp_bloc.dart';
import '../di/injection_container.dart';

final GoRouter router = GoRouter(
  initialLocation: '/register',
  routes: [
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => getIt<SignupBloc>(),
          child: Signup(),
        );
      },
    ),

    GoRoute(
      path: '/logIn',
      builder: (context, state) =>
          BlocProvider(create: (_) => getIt<LoginBloc>(), child: Login()),
    ),

    GoRoute(
      path: '/verification_code',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<OtpBloc>()),
          BlocProvider(create: (_) => getIt<ResendOtpBloc>(),),
        ],
        child: VerificationCode(),
      ),
    ),
   
  ],
);
