// data/repositories/complaints_repository_impl.dart


import 'package:complaints_application/features/my_complaints/data/models/helper_model.dart';

import '../../domain/entities/my_complaints_entity.dart';
import '../../domain/repositories/my_complaints_repositry.dart';
import '../datasources/my_complaints_remote_ds.dart';

class ComplaintsRepositoryImpl implements ComplaintsRepository {
  final ComplaintsRemoteDataSource remote;
  ComplaintsRepositoryImpl(this.remote);

  @override
  Future<List<ComplaintEntity>> getMyComplaints() async {
    final model = await remote.getMyComplaints();
    return model.toEntityList();
  }
}