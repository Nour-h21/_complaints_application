import '../../domain/entities/resend_otp_entity.dart';
import '../../domain/repositories/resend_otp_repository.dart';
import '../datasources/resend_otp_remote_ds.dart';

// class ResendOtpRepositoryImpl implements ResendOtpRepository {
//   final ResendOtpRemoteDs remote;

//   ResendOtpRepositoryImpl(this.remote);

//   @override
//   Future<ResendOtpEntity> resendOtp() async {
//     return await remote.resendOtp();
//   }
// }


import '../datasources/resend_otp_remote_ds.dart';


class ResendOtpRepositoryImpl implements ResendOtpRepository {
  final ResendOtpRemoteDs remote;

  ResendOtpRepositoryImpl(this.remote);

  @override
  Future<ResendOtpEntity> resendOtp() async {
    final response = await remote.resendOtp();

    // معالجة الرسائل هنا قبل إرسالها للـ Bloc
    if (response.message.contains("غير موجود")) {
      return ResendOtpEntity(
        status: false,
        message: "هذا الحساب غير موجود.",
      );
    }

    if (response.message.contains("مفعّل مسبقًا")) {
      return ResendOtpEntity(
        status: false,
        message: "الحساب مفعّل مسبقًا، لا حاجة لإعادة إرسال رمز التحقق.",
      );
    }

    // إذا نجحت العملية
    return ResendOtpEntity(
      status: true,
      message: response.message,
    );
  }
}