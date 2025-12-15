import 'dart:io';
import '../../domain/entities/add_complaint_entity.dart';

abstract class AddComplaintState {
  List<Object?> get props => [];
}

class AddComplaintInitial extends AddComplaintState {
  final String? selectedTypeId;
  final String? selectedDepartmentId;
  final List<File> attachments;

  AddComplaintInitial({
    this.selectedTypeId,
    this.selectedDepartmentId,
    this.attachments = const [],
  });

  AddComplaintInitial copyWith({
    String? selectedTypeId,
    String? selectedDepartmentId,
    List<File>? attachments,
  }) {
    return AddComplaintInitial(
      selectedTypeId: selectedTypeId ?? this.selectedTypeId,
      selectedDepartmentId: selectedDepartmentId ?? this.selectedDepartmentId,
      attachments: attachments ?? this.attachments,
    );
  }

  @override
  List<Object?> get props => [
    selectedTypeId,
    selectedDepartmentId,
    attachments,
  ];
}

class AddComplaintLoading extends AddComplaintState {
  final double progress; 
  AddComplaintLoading({this.progress = 0});
  @override
  List<Object?> get props => [progress];
}

class AddComplaintSuccess extends AddComplaintState {
  final AddComplaintEntity created;
  AddComplaintSuccess(this.created);
  @override
  List<Object?> get props => [created];
}

class AddComplaintFailure extends AddComplaintState {
  final String message;
  AddComplaintFailure(this.message);
  @override
  List<Object?> get props => [message];
}


class AddComplaintSubmitted extends AddComplaintInitial {
  AddComplaintSubmitted({
    super.selectedTypeId,
    super.selectedDepartmentId,
    super.attachments = const [],
  });
}


