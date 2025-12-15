import '../../domain/entities/details_complaint_entity.dart';
import '../models/details_complaint_model.dart';

extension DetailsModelMapper on DetailsComplaintModel {
  ComplaintDetailEntity toEntity(int id) {
    final data = this.data;
    final attachments = data.attachments.map((a) => a.attachment).toList();
    return ComplaintDetailEntity(
      id: id,
      typeId: data.complaintType.id,
      typeName: data.complaintType.type,
      departmentId: data.complaintDepartment.id,
      departmentName: data.complaintDepartment.departmentName,
      location: data.location,
      problemDescription: data.problemDescription,
      statusId: data.complaintStatus.id,
      statusName: data.complaintStatus.status,
      attachments: attachments,
    );
  }
}