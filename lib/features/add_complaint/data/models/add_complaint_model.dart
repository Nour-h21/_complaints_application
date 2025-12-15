// Generated/hand-adapted response model
import '../../domain/entities/add_complaint_entity.dart';

class AddComplaintModel {
  final int status;
  final DataModel data;
  final String message;

  AddComplaintModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory AddComplaintModel.fromJson(Map<String, dynamic> json) => AddComplaintModel(
        status: json["status"],
        data: DataModel.fromJson(json["data"]),
        message: json["message"],
      );
}

class DataModel {
  final ComplaintModel complaint;
  final List<String> attachments;

  DataModel({
    required this.complaint,
    required this.attachments,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        complaint: ComplaintModel.fromJson(json["complaint"]),
        attachments: List<String>.from(json["attachments"] ?? []),
      );
}

class ComplaintModel {
  final String complaintTypeId;
  final int userId;
  final String complaintDepartmentId;
  final int complaintStatusId;
  final String problemDescription;
  final String location;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  ComplaintModel({
    required this.complaintTypeId,
    required this.userId,
    required this.complaintDepartmentId,
    required this.complaintStatusId,
    required this.problemDescription,
    required this.location,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> json) => ComplaintModel(
        complaintTypeId: json["complaint_type_id"],
        userId: json["user_id"],
        complaintDepartmentId: json["complaint_department_id"],
        complaintStatusId: json["complaint_status_id"],
        problemDescription: json["problem_description"],
        location: json["location"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  AddComplaintEntity toEntity(List<String> attachments) {
    return AddComplaintEntity(
      id: id,
      complaintTypeId: complaintTypeId,
      complaintDepartmentId: complaintDepartmentId,
      complaintStatusId: complaintStatusId,
      problemDescription: problemDescription,
      location: location,
      attachments: attachments,
    );
  }
}