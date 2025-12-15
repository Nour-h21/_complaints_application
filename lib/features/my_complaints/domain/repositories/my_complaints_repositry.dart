// domain/repositories/complaints_repository.dart

import '../entities/my_complaints_entity.dart';

abstract class ComplaintsRepository {
  Future<List<ComplaintEntity>> getMyComplaints();
}