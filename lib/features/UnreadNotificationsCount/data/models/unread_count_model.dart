import '../../domain/entities/unread_count_entity.dart';

class UnreadCountModel
    extends UnreadCountEntity {
  UnreadCountModel({required super.count});

  factory UnreadCountModel.fromJson(
      Map<String, dynamic> json) {
    return UnreadCountModel(
      count: json['data'] ?? 0,
    );
  }
}