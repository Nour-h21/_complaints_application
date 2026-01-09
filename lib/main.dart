import 'package:complaints_application/app/di/injection_container.dart';
import 'package:complaints_application/app/routes/router.dart';
import 'package:complaints_application/features/change_password/presentation/pages/forgot_password.dart';
import 'package:complaints_application/features/details_complaint/presentation/bloc/details_complaint_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/di/injection_container.dart' as di;
import 'core/utils/helpers/size_config.dart';
import 'features/UnreadNotificationsCount/presentation/bloc/bloc/unread_count_bloc.dart';
import 'features/add_complaint/presentation/bloc/add_complaint_bloc.dart';
import 'features/change_password/presentation/bloc/change_password_bloc.dart';
import 'features/change_password/presentation/pages/check_code.dart';
import 'features/change_password/presentation/pages/reset_password.dart';
import 'features/notification/presentation/bloc/bloc/notifications_bloc.dart';
import 'features/signup.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("🔔 رسالة بالخلفية: ${message.notification?.title}");
}
import 'features/edit_complaint/presentation/bloc/edit_complaint_bloc.dart';
import 'features/settings/bloc/theme_bloc.dart';
import 'features/settings/bloc/theme_event.dart';
import 'features/settings/localization_bloc/bloc/translate_bloc.dart';
import 'features/settings/localization_bloc/bloc/translate_event.dart';
import 'features/settings/localization_bloc/bloc/translate_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  await Firebase.initializeApp();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  print('🔔 Notification permission: ${settings.authorizationStatus}');

  String? token = await messaging.getToken();
  print('🔥 FCM Token: $token');

  FirebaseMessaging.onBackgroundMessage(
    _firebaseMessagingBackgroundHandler,
  );
  
FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
  print('♻️ FCM TOKEN (onTokenRefresh): $newToken');
});

  runApp(const MyApp());
  await EasyLocalization.ensureInitialized();
  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const MyApp(),
    // ),
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
      path: 'assets/translation',
      fallbackLocale: const Locale('ar', 'AR'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AddComplaintBloc>(),),
          
        BlocProvider(create: (context) => getIt<DetailsBloc>(),),
        
        // BlocProvider(create: (_) => getIt<UnreadCountBloc>()),

        // BlocProvider(create: (_) => getIt<NotificationsBloc>()),

        // BlocProvider(create: (_) => getIt<ChangePasswordBloc>()),

        BlocProvider(create: (context) => getIt<AddComplaintBloc>()),

        BlocProvider(create: (context) => getIt<DetailsBloc>()),

        BlocProvider(create: (context) => getIt<EditComplaintBloc>()),

        BlocProvider(create: (context) => ThemeBloc()..add(InitThemeEvent())),

        BlocProvider(
          create: (_) => LocalizationBloc()..add(const LoadSavedLanguage()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        routerConfig: router,
        // home: SignupLight(),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, state) {
          return BlocBuilder<LocalizationBloc, LocalizationState>(
            builder: (context, localeState) {
              return MaterialApp.router(
                theme: state,
                debugShowCheckedModeBanner: false,
                useInheritedMediaQuery: true,
                locale: localeState.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                // locale: DevicePreview.locale(context),
                // builder: DevicePreview.appBuilder,
                routerConfig: router,
              );
            },
          );
        },
      ),
    );
  }
}
