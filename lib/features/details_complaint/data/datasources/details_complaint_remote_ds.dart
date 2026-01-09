import 'package:dio/dio.dart';
import '../models/details_complaint_model.dart';

abstract class DetailsRemoteDataSource {
  Future<DetailsComplaintModel> getComplaintDetails(int id);
}

class DetailsRemoteDataSourceImpl implements DetailsRemoteDataSource {
  final Dio dio;
  DetailsRemoteDataSourceImpl(this.dio);

  @override
  Future<DetailsComplaintModel> getComplaintDetails(int id) async {
    final response = await dio.get(
      'viewComplaintDetails/$id',
      options: Options(
        headers: {
          "Authorization":
              "Bearer 1|MnRE2dCMFGRQWPXh4BfUWYDJKK1ez1dva4LDneN07463b92e",
        },
      ),
    );
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return DetailsComplaintModel.fromJson(response.data);
    } else {
      throw Exception('Server error: ${response.statusCode}');
    }
  }
}
