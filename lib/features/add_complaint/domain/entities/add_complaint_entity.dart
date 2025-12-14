class AddComplaintEntity {
  final int id;
  final String complaintTypeId;
  final String complaintDepartmentId;
  final int complaintStatusId;
  final String problemDescription;
  final String location;
  final List<String> attachments;

  AddComplaintEntity({
    required this.id,
    required this.complaintTypeId,
    required this.complaintDepartmentId,
    required this.complaintStatusId,
    required this.problemDescription,
    required this.location,
    required this.attachments,
  });
}