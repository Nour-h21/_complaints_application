// data/datasources/complaints_remote_data_source.dart
import 'package:dio/dio.dart';
import '../models/my_complaints_model.dart';

abstract class ComplaintsRemoteDataSource {
  /// throws on non-2xx
  Future<MyComplaintModel> getMyComplaints();
}

class ComplaintsRemoteDataSourceImpl implements ComplaintsRemoteDataSource {
  final Dio dio;
  ComplaintsRemoteDataSourceImpl(this.dio);

  @override
  Future<MyComplaintModel> getMyComplaints() async {
    final response = await dio.get(
      'viewMyComplaints',
      options: Options(
        headers: {
          "Authorization":
              "Bearer 1|EqwdbI3diHdVXpg1Njap6hXmgTyDfov6CVEOYddd22ca1608",
        },
      ),
    ); // عدّل الـ path لو لازم
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return MyComplaintModel.fromJson(response.data);
    } else {
      throw Exception('Server error: ${response.statusCode}');
    }
  }
}
