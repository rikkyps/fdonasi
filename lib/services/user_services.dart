part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> login(String email, String password,
      {http.Client? client}) async {
    client ?? http.Client();

    var endPoint = Uri.http('donasi.codehater.net', '/api/login');
    var response = await http.post(endPoint,
        headers: {'Content-type': 'application/json'},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again!');
    }

    var data = jsonDecode(response.body);
    User.token = data['token'];
    User value = User.fromJSON(data['data']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> register(String email, String password,
      String passwordConfirmation, String name) async {
    var endPoint = Uri.http('donasi.codehater.net', '/api/register');
    return ApiReturnValue();
  }
}
