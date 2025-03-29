import '../../domain/entities/recovery_secret_request_entity.dart';

class RecoveryRequestSecretModel extends RecoverySecretRequestEntity {
  const RecoveryRequestSecretModel({
    required super.username,
    required super.password,
    required super.code,
  });

  factory RecoveryRequestSecretModel.fromEntity(RecoverySecretRequestEntity entity) {
    return RecoveryRequestSecretModel(
      username: entity.username,
      password: entity.password,
      code: entity.code,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'code': code,
    };
  }
}
