
import '../entities/add_complaint_entity.dart';
import '../repositories/add_complaint_repositry.dart';

class SubmitComplaintUseCase {
  final AddComplaintRepository repository;
  SubmitComplaintUseCase(this.repository);

  Future<AddComplaintEntity> call({
    required String complaintTypeId,
    required String complaintDepartmentId,
    required String problemDescription,
    required String location,
    required List<String> attachmentsPaths,
  }) async {
    return await repository.submitComplaint(
      complaintTypeId: complaintTypeId,
      complaintDepartmentId: complaintDepartmentId,
      problemDescription: problemDescription,
      location: location,
      attachmentsPaths: attachmentsPaths,
    );
  }
}