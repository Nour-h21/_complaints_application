class ComplaintEntity {
  final int id;
  final int typeId;
  final String typeName;
  final int departmentId;
  final String departmentName;
  final String location;
  final int statusId;
  final String statusName;

  ComplaintEntity({
    required this.id,
    required this.typeId,
    required this.typeName,
    required this.departmentId,
    required this.departmentName,
    required this.location,
    required this.statusId,
    required this.statusName,
  });
}