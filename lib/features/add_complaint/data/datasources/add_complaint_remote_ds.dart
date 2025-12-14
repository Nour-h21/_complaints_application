import 'dart:io';
import 'package:dio/dio.dart';
import '../models/add_complaint_model.dart';

abstract class AddComplaintRemoteDataSource {
  Future<AddComplaintModel> submitComplaint({
    required String complaintTypeId,
    required String complaintDepartmentId,
    required String problemDescription,
    required String location,
    required List<String> attachmentsPaths,
    void Function(int, int)? onSendProgress,
  });
}

class AddComplaintRemoteDataSourceImpl implements AddComplaintRemoteDataSource {
  final Dio dio;
  AddComplaintRemoteDataSourceImpl(this.dio);

  @override
  Future<AddComplaintModel> submitComplaint({
    required String complaintTypeId,
    required String complaintDepartmentId,
    required String problemDescription,
    required String location,
    required List<String> attachmentsPaths,
    void Function(int, int)? onSendProgress,
  }) async {
    final formData = FormData();

    //  Fields
    formData.fields.add(MapEntry('complaint_type_id', complaintTypeId));
    formData.fields.add(
      MapEntry('complaint_department_id', complaintDepartmentId),
    );
    formData.fields.add(MapEntry('problem_description', problemDescription));
    formData.fields.add(MapEntry('location', location));

    // Attachments
    for (final path in attachmentsPaths) {
      final fileName = path.split(Platform.pathSeparator).last;
      formData.files.add(
        MapEntry(
          'attachments[]',
          await MultipartFile.fromFile(path, filename: fileName),
        ),
      );
    }


    

    final response = await dio.post(
      'addComplaint',
      data: formData,
       onSendProgress: onSendProgress,
      options: Options(headers: {"Authorization": "Bearer 1|EqwdbI3diHdVXpg1Njap6hXmgTyDfov6CVEOYddd22ca1608"}),
    );

    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return AddComplaintModel.fromJson(response.data);
    } else {
      throw Exception('Server error: ${response.statusCode}');
    }
  }
}
