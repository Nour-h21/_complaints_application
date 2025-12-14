
import '../../domain/entities/details_complaint_entity.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final ComplaintDetailEntity detail;
  DetailsLoaded(this.detail);
}

class DetailsFailure extends DetailsState {
  final String message;
  DetailsFailure(this.message);
}