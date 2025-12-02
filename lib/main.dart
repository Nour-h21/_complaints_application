import 'package:flutter/material.dart';

import 'app/di/injection_container.dart' as di;
import 'core/utils/helpers/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // استدعاء DI الأساسي
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(
    );
  }
}

