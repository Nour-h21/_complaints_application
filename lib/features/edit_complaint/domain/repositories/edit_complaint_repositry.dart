import 'dart:io';
import '../entities/edit_complaint_entity.dart';

abstract class ComplaintRepository {
  Future<EditComplaintEntity> editComplaint({
    required int complaintId,
    required String description,
    required List<File> attachments,
  });
}