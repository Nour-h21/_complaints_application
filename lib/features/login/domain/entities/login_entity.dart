class LoginEntity {
  final int id;
  final int roleId;
  final String name;
  final String? email;
  final String? phone;
  final String photo;
  final int points;
  final int? genderId;
  final bool isVerified;
  final String token;

  LoginEntity({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.points,
    required this.genderId,
    required this.isVerified,
    required this.token,
  });
}
