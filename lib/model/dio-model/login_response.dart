class LoginResponseModel {
  final String token;

  const LoginResponseModel({
    required this.token,
  });

  factory LoginResponseModel.fromMap(Map map) {
    return LoginResponseModel(
      token: map['token'],
    );
  }

  Map<String, dynamic> asMap() => {
        'token': token,
      };
}
