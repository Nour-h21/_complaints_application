class ComplaintDetailEntity {
  final int id;
  final int typeId;
  final String typeName;
  final int departmentId;
  final String departmentName;
  final String location;
  final String problemDescription;
  final int statusId;
  final String statusName;
  final List<String> attachments; // URLs or local paths

  ComplaintDetailEntity({
    required this.id,
    required this.typeId,
    required this.typeName,
    required this.departmentId,
    required this.departmentName,
    required this.location,
    required this.problemDescription,
    required this.statusId,
    required this.statusName,
    required this.attachments,
  });
}