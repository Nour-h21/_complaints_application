// To parse this JSON data, do
//
//     final myComplaintModel = myComplaintModelFromJson(jsonString);

import 'dart:convert';

MyComplaintModel myComplaintModelFromJson(String str) => MyComplaintModel.fromJson(json.decode(str));

String myComplaintModelToJson(MyComplaintModel data) => json.encode(data.toJson());

class MyComplaintModel {
    int status;
    List<Datum> data;
    String message;

    MyComplaintModel({
        required this.status,
        required this.data,
        required this.message,
    });

    factory MyComplaintModel.fromJson(Map<String, dynamic> json) => MyComplaintModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    int id;
    ComplaintType complaintType;
    ComplaintDepartment complaintDepartment;
    String location;
    ComplaintStatus complaintStatus;

    Datum({
        required this.id,
        required this.complaintType,
        required this.complaintDepartment,
        required this.location,
        required this.complaintStatus,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        complaintType: ComplaintType.fromJson(json["complaint_type"]),
        complaintDepartment: ComplaintDepartment.fromJson(json["complaint_department"]),
        location: json["location"],
        complaintStatus: ComplaintStatus.fromJson(json["complaint_status"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "complaint_type": complaintType.toJson(),
        "complaint_department": complaintDepartment.toJson(),
        "location": location,
        "complaint_status": complaintStatus.toJson(),
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
