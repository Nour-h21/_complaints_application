

import '../entities/details_complaint_entity.dart';
import '../repositories/details_complaint_repositry.dart';

class GetComplaintDetailsUseCase {
  final ComplaintsDetailsRepository repository;
  GetComplaintDetailsUseCase(this.repository);

  Future<ComplaintDetailEntity> call(int id) =>
      repository.getComplaintDetails(id);
}