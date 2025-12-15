import 'dart:io';

abstract class AddComplaintEvent  {
  List<Object?> get props => [];
}

class AddComplaintTypeSelected extends AddComplaintEvent {
  final String complaintTypeId;
  AddComplaintTypeSelected(this.complaintTypeId);
  @override
  List<Object?> get props => [complaintTypeId];
}

class AddComplaintDepartmentSelected extends AddComplaintEvent {
  final String departmentId;
  AddComplaintDepartmentSelected(this.departmentId);
  @override
  List<Object?> get props => [departmentId];
}

class AddAttachmentEvent extends AddComplaintEvent {
  final File file;
  AddAttachmentEvent(this.file);
  @override
  List<Object?> get props => [file];
}

class RemoveAttachmentEvent extends AddComplaintEvent {
  final int index;
  RemoveAttachmentEvent(this.index);
  @override
  List<Object?> get props => [index];
}

class SubmitAddComplaintEvent extends AddComplaintEvent {
  final String description;
  final String location;
  SubmitAddComplaintEvent({required this.description, required this.location});
  @override
  List<Object?> get props => [description, location];
}


class ResetAddComplaintEvent extends AddComplaintEvent {}

