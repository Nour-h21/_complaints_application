import 'dart:io';
import '../entities/edit_complaint_entity.dart';
import '../repositories/edit_complaint_repositry.dart';

class EditComplaintUseCase {
  final ComplaintRepository repository;

  EditComplaintUseCase(this.repository);

  Future<EditComplaintEntity> call({
    required int complaintId,
    required String description,
    required List<File> attachments,
  }) {
    return repository.editComplaint(
      complaintId: complaintId,
      description: description,
      attachments: attachments,
    );
  }
}