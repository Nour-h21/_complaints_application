import 'package:get_it/get_it.dart';

import 'add_complaint_module.dart';
import 'change_password_module.dart';
import 'logout_module.dart';
import 'edit_complaint_module.dart';
import 'my_complaints_module.dart';
import 'core_module.dart';
import 'details_complaint.dart';
import 'login_module.dart';
import 'notifications_module.dart';
import 'resend_otp_module.dart';
import 'signup_module.dart';
import 'unread_count_module.dart';
import 'update_device_token_module.dart';
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
  await initUpdateDeviceTokenModule();
  await initNotoficationsModule();
  await initUnreadCountModule();
  await initLogOutModule();
  await initChangePasswordModule();
  await initEditcomplaintModule();
}
