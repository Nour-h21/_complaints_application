

import '../entities/my_complaints_entity.dart';
import '../repositories/my_complaints_repositry.dart';

class GetMyComplaintsUseCase {
  final ComplaintsRepository repository;
  GetMyComplaintsUseCase(this.repository);

  Future<List<ComplaintEntity>> call() async {
    return await repository.getMyComplaints();
  }
}