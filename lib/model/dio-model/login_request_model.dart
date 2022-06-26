class LoginRequestModel {
  final String username;
  final String password;
  final String key;

  LoginRequestModel({
    required this.username,
    required this.password,
    required this.key,
  });

    Map<String, dynamic> asMap() => {
        'username': username,
        'password': password,
        'key': key,
      };
}
