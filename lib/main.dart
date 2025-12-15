import 'package:complaints_application/app/di/injection_container.dart';
import 'package:complaints_application/app/routes/router.dart';
import 'package:complaints_application/features/details_complaint/presentation/bloc/details_complaint_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/di/injection_container.dart' as di;
import 'core/utils/helpers/size_config.dart';
import 'features/add_complaint/presentation/bloc/add_complaint_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // استدعاء DI الأساسي
  await di.init();
  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const MyApp(),
    // ),
    const MyApp(),
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
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        routerConfig: router,
      ),
    );
  }
}
