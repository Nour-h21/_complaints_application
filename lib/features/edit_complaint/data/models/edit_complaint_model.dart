// // To parse this JSON data, do
// //
// //     final editComplaintModel = editComplaintModelFromJson(jsonString);

// import 'dart:convert';

// EditComplaintModel editComplaintModelFromJson(String str) => EditComplaintModel.fromJson(json.decode(str));

// String editComplaintModelToJson(EditComplaintModel data) => json.encode(data.toJson());

// class EditComplaintModel {
//     int status;
//     Data data;
//     String message;

//     EditComplaintModel({
//         required this.status,
//         required this.data,
//         required this.message,
//     });

//     factory EditComplaintModel.fromJson(Map<String, dynamic> json) => EditComplaintModel(
//         status: json["status"],
//         data: Data.fromJson(json["data"]),
//         message: json["message"],
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": data.toJson(),
//         "message": message,
//     };
// }

// class Data {
//     String attachment;
//     int complaintId;
//     int complaintVersionId;
//     DateTime updatedAt;
//     DateTime createdAt;
//     int id;

//     Data({
//         required this.attachment,
//         required this.complaintId,
//         required this.complaintVersionId,
//         required this.updatedAt,
//         required this.createdAt,
//         required this.id,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         attachment: json["attachment"],
//         complaintId: json["complaint_id"],
//         complaintVersionId: json["complaint_version_id"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         id: json["id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "attachment": attachment,
//         "complaint_id": complaintId,
//         "complaint_version_id": complaintVersionId,
//         "updated_at": updatedAt.toIso8601String(),
//         "created_at": createdAt.toIso8601String(),
//         "id": id,
//     };
// }
class EditComplaintModel {
  final int id;
  final String? attachment;

  EditComplaintModel({
    required this.id,
    required this.attachment,
  });

  factory EditComplaintModel.fromJson(Map<String, dynamic> json) {
    return EditComplaintModel(
      id: json['id'],
      attachment: json['attachment'],
    );
  }
}