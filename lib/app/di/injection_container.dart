import 'package:complaints_application/app/di/resend_otp_module.dart';
import 'package:get_it/get_it.dart';

import 'add_complaint_module.dart';
import 'edit_complaint_module.dart';
import 'my_complaints_module.dart';
import 'core_module.dart';
import 'details_complaint.dart';
import 'login_module.dart';
import 'signup_module.dart';
import 'verify_otp_module.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await initCoreModule();
  await initLoginModule();
  await initVerifyOtpModule();
  await initResendOtpModule();
  await initSignupModule();
  await initMyComplaintsModule();
  await initAddcomplaintModule();
  await initDetailsomplaintModule();
  await initEditcomplaintModule();
}
