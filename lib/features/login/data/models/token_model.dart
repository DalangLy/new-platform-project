import 'package:platform_project_new/features/login/domain/entities/token.dart';
import '../../../../core/core_export.dart';

class TokenModel extends Token {
  TokenModel({
    required String accessToken,
    required String refreshToken,
    required DateTime refreshTokenExpiryTime,
  }) : super(
          accessToken: accessToken,
          refreshToken: refreshToken,
          refreshTokenExpiryTime: refreshTokenExpiryTime,
        );

  factory TokenModel.fromJson({required Map<String, dynamic> json,}){
    try{
      return TokenModel(accessToken: json['token'] as String, refreshToken: json['refreshToken'] as String, refreshTokenExpiryTime: DateTime.parse(json['refreshTokenExpiryTime'] as String));

    }catch(e){
      throw SerializeTokenFailure(message: 'Failed To Serialize Token');
    }
  }
}
