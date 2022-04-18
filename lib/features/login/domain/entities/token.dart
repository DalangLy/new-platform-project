class Token{
  final String accessToken;
  final String refreshToken;
  final DateTime refreshTokenExpiryTime;
  const Token({required this.accessToken, required this.refreshToken, required this.refreshTokenExpiryTime,});
}