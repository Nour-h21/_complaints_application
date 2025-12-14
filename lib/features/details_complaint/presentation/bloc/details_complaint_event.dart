abstract class DetailsEvent {}

class LoadComplaintDetails extends DetailsEvent {
  final int id;
  LoadComplaintDetails(this.id);
}

class RefreshComplaintDetails extends DetailsEvent {
  final int id;
  RefreshComplaintDetails(this.id);
}