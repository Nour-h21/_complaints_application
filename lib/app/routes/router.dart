import 'package:complaints_application/features/add_complaint/presentation/bloc/add_complaint_bloc.dart';
import 'package:complaints_application/features/add_complaint/presentation/pages/add_complaint.dart';
import 'package:complaints_application/features/change_password/presentation/bloc/change_password_bloc.dart';
import 'package:complaints_application/features/change_password/presentation/pages/check_code.dart';
import 'package:complaints_application/features/change_password/presentation/pages/forgot_password.dart';
import 'package:complaints_application/features/change_password/presentation/pages/reset_password.dart';
import 'package:complaints_application/features/details_complaint/presentation/pages/details_complaint.dart';
import 'package:complaints_application/features/logout/presentation/bloc/logout_bloc.dart';
import 'package:complaints_application/features/my_complaints/presentation/pages/my_complaints.dart';
import 'package:complaints_application/features/notification/presentation/bloc/bloc/notifications_bloc.dart';
import 'package:complaints_application/features/notification/presentation/pages/notifications_n.dart';
import 'package:complaints_application/features/signup/presentation/pages/signup.dart';
import 'package:complaints_application/features/verification_code/presentation/pages/verification_code.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/UnreadNotificationsCount/presentation/bloc/bloc/unread_count_bloc.dart';
import '../../features/UnreadNotificationsCount/presentation/bloc/bloc/unread_count_event.dart';
import '../../features/details_complaint/domain/usecase/details_complaint_usecase.dart';
import '../../features/details_complaint/presentation/bloc/details_complaint_bloc.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/my_complaints/domain/usecase/my_complaints_usecase.dart';
import '../../features/my_complaints/presentation/bloc/my_complaint_bloc.dart';
import '../../features/notification/presentation/pages/notifications.dart';
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

        ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (_) => getIt<ChangePasswordBloc>(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/ForgotPassword',
          builder: (context, state) => ForgotPassword(),
        ),
        GoRoute(
          path: '/checkCode',
          builder: (context, state) => CheckCode(),
        ),
        GoRoute(
          path: '/resetPassword',
          builder: (context, state) => ResetPassword(),
        ),
      ],
    ),

    // GoRoute(
    //   path: '/ForgotPassword',
    //   builder: (context, state) => BlocProvider(
    //     create: (context) => getIt<ChangePasswordBloc>(),
    //     child: ForgotPassword(),
    //   ),
    // ),

    // GoRoute(path: '/checkCode', builder: (context, state) => CheckCode()),

    // GoRoute(
    //   path: '/resetPassword',
    //   builder: (context, state) => ResetPassword(),
    // ),

    GoRoute(
      path: '/verification_code',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<OtpBloc>()),
          BlocProvider(create: (_) => getIt<ResendOtpBloc>()),
        ],
        child: VerificationCode(),
      ),
    ),

    GoRoute(
      path: '/Notifications',
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<NotificationsBloc>(),
        child: Notifications(),
      ),
    ),

    GoRoute(
      path: '/MyComplaints',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ComplaintsBloc(getIt<GetMyComplaintsUseCase>()),
          ),
          BlocProvider(
            create: (_) =>
                getIt<UnreadCountBloc>()..add(FetchUnreadCountEvent()),
          ),
          BlocProvider(create: (_) => getIt<UnreadCountBloc>()),

        BlocProvider(create: (_) => getIt<NotificationsBloc>()),
        ],
        child: MyComplaints(),
      ),
    ),
    GoRoute(
      path: '/MyComplaints/DetailsComplaint',
      builder: (context, state) => BlocProvider(
        create: (_) => DetailsBloc(getIt<GetComplaintDetailsUseCase>()),
        child: DetailsComplaint(complaintId: 1),
      ),
    ),

    GoRoute(
      path: '/AddComplaint',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AddComplaintBloc>(),
        child: AddComplaint(),
      ),
    ),
  ],
);
