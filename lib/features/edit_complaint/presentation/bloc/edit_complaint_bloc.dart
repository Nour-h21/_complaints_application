import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/edit_complaint_usecase.dart';
import 'edit_complaint_event.dart';
import 'edit_complaint_state.dart';

class EditComplaintBloc
    extends Bloc<EditComplaintEvent, EditComplaintState> {
  final EditComplaintUseCase useCase;

  EditComplaintBloc(this.useCase)
      : super(EditComplaintState()) {
    on<AddAttachmentEvent>((e, emit) {
      final list = List.of(state.attachments)..add(e.file);
      emit(state.copyWith(attachments: list));
    });


    on<RemoveAttachmentEvent>((e, emit) {
      final list = List.of(state.attachments)..removeAt(e.index);
      emit(state.copyWith(attachments: list));
    });
    


  on<SubmitEditComplaintEvent>((e, emit) async {
  emit(state.copyWith(
    loading: true,
    attachments: state.attachments,
    error: '',
    success: false,
  ));

  try {
    await useCase(
      complaintId: e.complaintId,
      description: e.description,
      attachments: state.attachments,
    );

    emit(state.copyWith(
      loading: false,
      attachments: state.attachments,
      error: '',
      success: true,
    ));
  }
   catch (err) {
    emit(state.copyWith(
      loading: false,
      attachments: state.attachments,
      error: err.toString(),
      success: false,
    ));
  }
});

//    on<SubmitEditComplaintEvent>((e, emit) async {
//   emit(state.copyWith(
//     loading: true,
//     error: '',      // 🧼 امسحي أي خطأ
//     success: false,
//   ));

//   try {
//     await useCase(
//       complaintId: e.complaintId,
//       description: e.description,
//       attachments: state.attachments,
//     );

//     emit(state.copyWith(
//       loading: false,
//       success: true,
//       error: '',      // 🧼 امسحي أي خطأ
//     ));
//   } catch (err) {
//     emit(state.copyWith(
//       loading: false,
//       error: err.toString(),
//     ));
//   }
// });

    // on<SubmitEditComplaintEvent>((e, emit) async {
    //   emit(state.copyWith(loading: true));

    //   try {
    //     await useCase(
    //       complaintId: e.complaintId,
    //       description: e.description,
    //       attachments: state.attachments,
    //     );

    //     emit(state.copyWith(loading: false, success: true));
    //   } catch (err) {
    //     print("eeeeeeeeeeeeeeeeeeeeeeeeeeeee:$err");
    //     emit(state.copyWith(
    //       loading: false,
    //       error: err.toString(),
    //     ));
    //   }
    // });
  }
}