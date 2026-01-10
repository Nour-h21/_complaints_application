import 'dart:io';
import 'package:dio/dio.dart';
import '../models/edit_complaint_model.dart';

abstract class ComplaintRemoteDataSource {
  Future<EditComplaintModel> editComplaint({
    required int complaintId,
    required String description,
    required List<File> attachments,
  });
}

class ComplaintRemoteDataSourceImpl
    implements ComplaintRemoteDataSource {
  final Dio dio;

  ComplaintRemoteDataSourceImpl(this.dio);

  @override
  Future<EditComplaintModel> editComplaint({
    required int complaintId,
    required String description,
    required List<File> attachments,
  }) async {
      try{
    final formData = FormData.fromMap({
      'problem_description': description,
      'attachments[]': attachments
          .map((e) => MultipartFile.fromFileSync(e.path))
          .toList(),
    });
 
    final response = await dio.post(
      '/responsedToAdditionalInfo/$complaintId',
      data: formData,
       options: Options(headers: {"Authorization": "Bearer 1|MnRE2dCMFGRQWPXh4BfUWYDJKK1ez1dva4LDneN07463b92e"}),
    );

    return EditComplaintModel.fromJson(response.data['data']);
    
  }
 on DioException catch(e){
    if (e.response?.statusCode == 404) {
      // throw ApiException("لا يوجد طلب معلومات مفتوح لهذه الشكوى");
      throw ApiException("There is no open request for this complaint");
    }
    else if(e.response?.statusCode == 200){
      throw ApiException("The Complaint Updated");
    }
    return  throw ApiException("Somthing was wrong!");
  }
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}
