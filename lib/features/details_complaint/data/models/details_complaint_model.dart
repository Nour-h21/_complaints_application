// To parse this JSON data, do
//
//     final detailsComplaintModel = detailsComplaintModelFromJson(jsonString);

import 'dart:convert';

DetailsComplaintModel detailsComplaintModelFromJson(String str) => DetailsComplaintModel.fromJson(json.decode(str));

String detailsComplaintModelToJson(DetailsComplaintModel data) => json.encode(data.toJson());

class DetailsComplaintModel {
    int status;
    Data data;
    String message;

    DetailsComplaintModel({
        required this.status,
        required this.data,
        required this.message,
    });

    factory DetailsComplaintModel.fromJson(Map<String, dynamic> json) => DetailsComplaintModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    ComplaintType complaintType;
    ComplaintDepartment complaintDepartment;
    String location;
    String problemDescription;
    ComplaintStatus complaintStatus;
    List<Attachment> attachments;

    Data({
        required this.complaintType,
        required this.complaintDepartment,
        required this.location,
        required this.problemDescription,
        required this.complaintStatus,
        required this.attachments,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        complaintType: ComplaintType.fromJson(json["complaint_type"]),
        complaintDepartment: ComplaintDepartment.fromJson(json["complaint_department"]),
        location: json["location"],
        problemDescription: json["problem_description"],
        complaintStatus: ComplaintStatus.fromJson(json["complaint_status"]),
        attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "complaint_type": complaintType.toJson(),
        "complaint_department": complaintDepartment.toJson(),
        "location": location,
        "problem_description": problemDescription,
        "complaint_status": complaintStatus.toJson(),
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
    };
}

class Attachment {
    int id;
    String attachment;

    Attachment({
        required this.id,
        required this.attachment,
    });

    factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["id"],
        attachment: json["attachment"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attachment": attachment,
    };
}

class ComplaintDepartment {
    int id;
    String departmentName;

    ComplaintDepartment({
        required this.id,
        required this.departmentName,
    });

    factory ComplaintDepartment.fromJson(Map<String, dynamic> json) => ComplaintDepartment(
        id: json["id"],
        departmentName: json["department_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "department_name": departmentName,
    };
}

class ComplaintStatus {
    int id;
    String status;

    ComplaintStatus({
        required this.id,
        required this.status,
    });

    factory ComplaintStatus.fromJson(Map<String, dynamic> json) => ComplaintStatus(
        id: json["id"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
    };
}

class ComplaintType {
    int id;
    String type;

    ComplaintType({
        required this.id,
        required this.type,
    });

    factory ComplaintType.fromJson(Map<String, dynamic> json) => ComplaintType(
        id: json["id"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
    };
}
