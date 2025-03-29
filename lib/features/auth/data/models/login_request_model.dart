import '../../domain/entities/login_request_entity.dart';

class LoginRequestModel extends LoginRequestEntity {
  const LoginRequestModel({
    required super.username,
    required super.password,
    super.totpCode,
  });

  factory LoginRequestModel.fromEntity(LoginRequestEntity entity, String totpCode) {
    return LoginRequestModel(
      username: entity.username,
      password: entity.password,
      totpCode: totpCode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'totp_code': totpCode,
    };
  }
}
