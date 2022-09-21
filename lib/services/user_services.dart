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
      return ApiReturnValue(message: 'Email atau password salah!');
    }

    var data = jsonDecode(response.body);
    User.token = data['token'];
    User value = User.fromJSON(data['data']);
    storeToken(User.token!);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> register(String email, String password,
      String passwordConfirmation, String name) async {
    var endPoint = Uri.http('donasi.codehater.net', '/api/register');
    var response = await http.post(endPoint,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation
        }));

    if (response.statusCode != 201) {
      return ApiReturnValue(message: 'Register gagal, email sudah dipakai');
    }

    var data = jsonDecode(response.body);
    User.token = data['token'];
    User value = User.fromJSON(data['data']);
    storeToken(User.token!);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> updatePassword(
      String password, String confirmation,
      {http.Client? client}) async {
    client ?? http.Client();
    String? token = await UserServices.getStoreToken();
    var endPoint = Uri.http('donasi.codehater.net', '/api/profile/password');
    var response = await http.post(
      endPoint,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        <String, String>{
          'password': password,
          'password_confirmation': confirmation,
        },
      ),
    );

    if (response.statusCode != 201) {
      return ApiReturnValue(message: 'Update password gagal!');
    }

    var data = jsonDecode(response.body);
    User value = User.fromJSON(data['data']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> updateProfile(String name,
      {http.Client? client}) async {
    client ?? http.Client();
    String? token = await UserServices.getStoreToken();
    var endPoint = Uri.http('donasi.codehater.net', '/api/profile');
    var response = await http.post(
      endPoint,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        <String, String>{
          'name': name,
        },
      ),
    );

    if (response.statusCode != 201) {
      return ApiReturnValue(message: 'Update profile gagal!');
    }

    var data = jsonDecode(response.body);
    User value = User.fromJSON(data['data']);

    return ApiReturnValue(value: value);
  }

  static Future<bool> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('storeToken') ?? '';

    bool result = false;
    if (token == '') {
      result = false;
    } else {
      result = true;
    }
    return result;
  }

  static void storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('storeToken', token);
  }

  static Future<String> getStoreToken() async {
    final prefs = await SharedPreferences.getInstance();
    String storeToken = prefs.getString('storeToken') ?? '';
    if (storeToken == '') {
      return storeToken;
    }
    return storeToken;
  }

  static void removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('storeToken');
  }

  static Future<ApiReturnValue<User>> checkSession() async {
    bool? token = await UserServices.checkToken();
    String? storeToken;
    if (!token) {
      return ApiReturnValue(message: 'Login terlebih dahulu');
    } else {
      storeToken = await UserServices.getStoreToken();
    }
    var endPoint = Uri.http('donasi.codehater.net', '/api/profile');
    var response = await http.get(
      endPoint,
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $storeToken',
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Login terlebih dahulu');
    }

    var data = jsonDecode(response.body);
    User.token = storeToken;
    User value = User.fromJSON(data['data']);

    return ApiReturnValue(value: value);
  }
}
