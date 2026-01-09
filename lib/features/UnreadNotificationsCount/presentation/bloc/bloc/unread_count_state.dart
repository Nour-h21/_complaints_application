abstract class UnreadCountState {}

class UnreadCountInitial extends UnreadCountState {}

class UnreadCountLoading extends UnreadCountState {}

class UnreadCountLoaded extends UnreadCountState {
  final int count;
  UnreadCountLoaded(this.count);
}

class UnreadCountError extends UnreadCountState {
  final String message;
  UnreadCountError(this.message);
}