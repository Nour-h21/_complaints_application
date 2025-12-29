class ForgotPasswordEntity {
  final String email;
  final int code;
  final int role;
  const ForgotPasswordEntity({
    required this.email,
    required this.code,
    required this.role,
  });
}
