import 'package:get_it/get_it.dart';

import 'add_complaint_module.dart';
import 'complaints_module.dart';
import 'core_module.dart';
import 'details_complaint.dart';
import 'login_module.dart';
import 'signup_module.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await initCoreModule();
  await initLoginModule();
  await initSignupModule();
  await initComplaintsModule();
  await initAddcomplaintModule();
  await initDetailsomplaintModule();
}
