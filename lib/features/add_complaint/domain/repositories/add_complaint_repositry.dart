

import '../entities/add_complaint_entity.dart';

abstract class AddComplaintRepository {
  /// Submits a complaint (multipart form). Returns created ComplaintEntity on success.
  Future<AddComplaintEntity> submitComplaint({
    required String complaintTypeId,
    required String complaintDepartmentId,
    required String problemDescription,
    required String location,
    required List<String> attachmentsPaths, // local file paths for upload
  });
}