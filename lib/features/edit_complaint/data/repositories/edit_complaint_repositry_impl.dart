import 'dart:io';
import '../../domain/entities/edit_complaint_entity.dart';
import '../../domain/repositories/edit_complaint_repositry.dart';
import '../datasources/edit_complaint_remote_ds.dart';


class ComplaintRepositoryImpl implements ComplaintRepository {
  final ComplaintRemoteDataSource remote;

  ComplaintRepositoryImpl(this.remote);

  @override
  Future<EditComplaintEntity> editComplaint({
    required int complaintId,
    required String description,
    required List<File> attachments,
  }) async {
    final result = await remote.editComplaint(
      complaintId: complaintId,
      description: description,
      attachments: attachments,
    );

    return EditComplaintEntity(
      id: result.id,
      attachment: result.attachment?? '',
    );
  }
}