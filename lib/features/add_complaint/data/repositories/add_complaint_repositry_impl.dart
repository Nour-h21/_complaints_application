import '../../domain/entities/add_complaint_entity.dart';
import '../../domain/repositories/add_complaint_repositry.dart';
import '../datasources/add_complaint_remote_ds.dart';
import '../models/add_complaint_model.dart';

class AddComplaintRepositoryImpl implements AddComplaintRepository {
  final AddComplaintRemoteDataSource remote;
  AddComplaintRepositoryImpl(this.remote);

  @override
  Future<AddComplaintEntity> submitComplaint({
    required String complaintTypeId,
    required String complaintDepartmentId,
    required String problemDescription,
    required String location,
    required List<String> attachmentsPaths,
  }) async {
    final AddComplaintModel res = await remote.submitComplaint(
      complaintTypeId: complaintTypeId,
      complaintDepartmentId: complaintDepartmentId,
      problemDescription: problemDescription,
      location: location,
      attachmentsPaths: attachmentsPaths,
    );

    // map model -> entity using complaint model and attachments from response
    final complaintModel = res.data.complaint;
    final attachments = res.data.attachments;
    return complaintModel.toEntity(attachments);
  }
}