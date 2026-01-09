import '../../domain/entities/check_code_entity.dart';

class CheckCodeModel extends CheckCodeEntity {
  CheckCodeModel({
    required super.token,
    required super.code,
  });

  factory CheckCodeModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"];

    return CheckCodeModel(
      token: data['token'],
      code: data['code'],
    );
  }
}