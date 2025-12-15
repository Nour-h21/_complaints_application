
import '../entities/details_complaint_entity.dart';

abstract class ComplaintsDetailsRepository {
  /// Get complaint details by id
  Future<ComplaintDetailEntity> getComplaintDetails(int id);
}