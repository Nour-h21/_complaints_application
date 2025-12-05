import 'package:complaints_application/app/routes/router.dart';
import 'package:flutter/material.dart';

import 'app/di/injection_container.dart' as di;
import 'core/utils/helpers/size_config.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      routerConfig: router,
    );
  }
}

