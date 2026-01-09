import 'dart:io';

abstract class EditComplaintEvent {}

class AddAttachmentEvent extends EditComplaintEvent {
  final File file;
  AddAttachmentEvent(this.file);
}

class RemoveAttachmentEvent extends EditComplaintEvent {
  final int index;
  RemoveAttachmentEvent(this.index);
}

class SubmitEditComplaintEvent extends EditComplaintEvent {
  final int complaintId;
  final String description;

  SubmitEditComplaintEvent({
    required this.complaintId,
    required this.description,
  });
}