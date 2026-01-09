// import 'dart:io';

// class EditComplaintState {
//   final bool loading;
//   final List<File> attachments;
//   final String? error;
//   final bool success;

//   EditComplaintState({
//     this.loading = false,
//     this.attachments = const [],
//     this.error,
//     this.success = false,
//   });

//   EditComplaintState copyWith({
//     bool? loading,
//     List<File>? attachments,
//     String? error,
//     bool? success,
//   }) {
//     return EditComplaintState(
//       loading: loading ?? this.loading,
//       attachments: attachments ?? this.attachments,
//       error: error,
//       success: success ?? this.success,
//     );
//   }
// }

import 'dart:io';

class EditComplaintState {
  final bool loading;
  final List<File> attachments;
  final String error; // ⬅️ غير nullable
  final bool success;

  const EditComplaintState({
    this.loading = false,
    this.attachments = const [],
    this.error = '', // ⬅️ default آمن
    this.success = false,
  });

  EditComplaintState copyWith({
    bool? loading,
    List<File>? attachments,
    String? error,
    bool? success,
  }) {
    return EditComplaintState(
      loading: loading ?? this.loading,
      attachments: attachments ?? this.attachments,
      error: error ?? this.error,
      success: success ?? this.success,
    );
  }
}

// import 'dart:io';

// class EditComplaintState {
//   final bool loading;
//   final List<File> attachments;
//   final String error;
//   final bool success;

//   const EditComplaintState({
//     required this.loading,
//     required this.attachments,
//     required this.error,
//     required this.success,
//   });

//   /// الحالة الافتراضية
//   factory EditComplaintState.initial() {
//     return const EditComplaintState(
//       loading: false,
//       attachments: [],
//       error: '',
//       success: false,
//     );
//   }

//   /// ❌ لا nullable نهائيًا
//   EditComplaintState copyWith({
//     required bool loading,
//     required List<File> attachments,
//     required String error,
//     required bool success,
//   }) {
//     return EditComplaintState(
//       loading: loading,
//       attachments: attachments,
//       error: error,
//       success: success,
//     );
//   }
// }