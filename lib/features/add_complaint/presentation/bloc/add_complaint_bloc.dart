import 'dart:io';
import 'package:bloc/bloc.dart';
import '../../domain/usecase/add_complaint_usecase.dart';
import 'add_complaint_event.dart';
import 'add_complaint_state.dart';

class AddComplaintBloc extends Bloc<AddComplaintEvent, AddComplaintState> {
  final SubmitComplaintUseCase submitUseCase;

  AddComplaintBloc({required this.submitUseCase})
    : super(AddComplaintInitial(attachments: [])) {
    on<AddComplaintTypeSelected>((event, emit) {
      final st = state;
      if (st is AddComplaintInitial) {
        emit(st.copyWith(selectedTypeId: event.complaintTypeId));
      } else {
        emit(
          AddComplaintInitial(
            selectedTypeId: event.complaintTypeId,
            attachments: [],
          ),
        );
      }
    });

    on<AddComplaintDepartmentSelected>((event, emit) {
      final st = state;
      if (st is AddComplaintInitial) {
        emit(st.copyWith(selectedDepartmentId: event.departmentId));
      } else {
        emit(
          AddComplaintInitial(
            selectedDepartmentId: event.departmentId,
            attachments: [],
          ),
        );
      }
    });

    on<AddAttachmentEvent>((event, emit) {
      final st = state;

      if (st is AddComplaintInitial) {
        final updated = List<File>.from(st.attachments)..add(event.file);
        emit(st.copyWith(attachments: updated));
      }
    });

    //     on<AddAttachmentEvent>((event, emit) {
    //   final st = state;

    //   if (st is AddComplaintInitial) {
    //     final currentAttachments = List<File>.from(st.attachments);
    //     currentAttachments.add(event.file);

    //     emit(
    //       st.copyWith(
    //         attachments: currentAttachments,
    //       ),
    //     );
    //   }
    // });

    on<RemoveAttachmentEvent>((event, emit) {
      final st = state;
      if (st is AddComplaintInitial) {
        final current = List<File>.from(st.attachments)..removeAt(event.index);
        emit(st.copyWith(attachments: current));
      }
    });

    //     on<RemoveAttachmentEvent>((event, emit) {
    //   final st = state;

    //   if (st is AddComplaintInitial) {
    //     final updated = List<File>.from(st.attachments)..removeAt(event.index);
    //     emit(st.copyWith(attachments: updated));
    //   }
    // });

    on<SubmitAddComplaintEvent>((event, emit) async {
      final st = state;
      if (st is! AddComplaintInitial) {
        emit(AddComplaintFailure('حالة غير صالحة'));
        return;
      }
      if (st.selectedTypeId == null || st.selectedDepartmentId == null) {
        emit(AddComplaintFailure('الرجاء اختيار النوع والقسم'));
        return;
      }
      // if (st.attachments.isEmpty) {
      //   emit(AddComplaintFailure("الرجاء اختيار مرفق واحد على الأقل"));
      //   return;
      // }

      try {
        emit(AddComplaintLoading(progress: 0));

        final paths = st.attachments.map((f) => f.path).toList();

        final result = await submitUseCase.call(
          complaintTypeId: st.selectedTypeId!,
          complaintDepartmentId: st.selectedDepartmentId!,
          problemDescription: event.description,
          location: event.location,
          attachmentsPaths: paths,
        );

        emit(AddComplaintSuccess(result));
      } catch (e) {
        emit(AddComplaintFailure(e.toString()));
      }
    });

//New
    on<ResetAddComplaintEvent>((event, emit) {
      final st = state;
      emit(
        AddComplaintInitial(
          selectedTypeId:  null,
          selectedDepartmentId:null,
          attachments: [], // امسح المرفقات السابقة
        ),
      );
    });



  }
}
