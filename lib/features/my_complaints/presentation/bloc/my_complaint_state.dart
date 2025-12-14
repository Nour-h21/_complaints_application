import '../../domain/entities/my_complaints_entity.dart';

abstract class ComplaintsState {}

class ComplaintsInitial extends ComplaintsState {}

class ComplaintsLoading extends ComplaintsState {}

class ComplaintsLoaded extends ComplaintsState {
  final List<ComplaintEntity> complaints;
  ComplaintsLoaded(this.complaints);
}

class ComplaintsFailure extends ComplaintsState {
  final String message;
  ComplaintsFailure(this.message);
}