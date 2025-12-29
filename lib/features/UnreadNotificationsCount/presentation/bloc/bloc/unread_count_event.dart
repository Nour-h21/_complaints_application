abstract class UnreadCountEvent {}

class FetchUnreadCountEvent extends UnreadCountEvent {}

class StartUnreadCountPolling extends UnreadCountEvent {}

class StopUnreadCountPolling extends UnreadCountEvent {}