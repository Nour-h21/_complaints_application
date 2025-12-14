

import 'package:complaints_application/features/details_complaint/data/models/helper_model.dart';

import '../../domain/entities/details_complaint_entity.dart';
import '../../domain/repositories/details_complaint_repositry.dart';
import '../datasources/details_complaint_remote_ds.dart';

class ComplaintsRepositoryImpl implements ComplaintsDetailsRepository {
  final DetailsRemoteDataSource remote;
  ComplaintsRepositoryImpl(this.remote);

  @override
  Future<ComplaintDetailEntity> getComplaintDetails(int id) async {
    final model = await remote.getComplaintDetails(id);
    return model.toEntity(id);
  }
}