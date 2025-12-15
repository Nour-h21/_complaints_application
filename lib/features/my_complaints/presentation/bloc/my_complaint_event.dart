// presentation/bloc/complaints_event.dart
abstract class ComplaintsEvent {}

class LoadComplaintsEvent extends ComplaintsEvent {}

class RefreshComplaintsEvent extends ComplaintsEvent {}