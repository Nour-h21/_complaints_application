// data/mappers/complaint_mapper.dart

import '../../domain/entities/my_complaints_entity.dart';
import 'my_complaints_model.dart';

extension MyComplaintModelMapper on Datum {
  ComplaintEntity toEntity() {
    return ComplaintEntity(
      id: id,
      typeId: complaintType.id,
      typeName: complaintType.type,
      departmentId: complaintDepartment.id,
      departmentName: complaintDepartment.departmentName,
      location: location,
      statusId: complaintStatus.id,
      statusName: complaintStatus.status,
    );
  }
}

extension MyComplaintModelListMapper on MyComplaintModel {
  List<ComplaintEntity> toEntityList() {
    return data.map((e) => e.toEntity()).toList();
  }
}