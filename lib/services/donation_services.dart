part of 'services.dart';

class DonationServices {
  static Future<ApiReturnValue<List<Donation>>> getCampaign(
      {http.Client? client}) async {
    client ?? http.Client();

    var endPoint = Uri.http('donasi.codehater.net', '/api/campaign');
    var response = await http.get(
      endPoint,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again!');
    }

    var data = jsonDecode(response.body);
    List<Donation> value = (data['data']['data'] as Iterable)
        .map((e) => Donation.fromJSON(e))
        .toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<Donation>> searchDonation(String? keyword,
      {http.Client? client}) async {
    client ?? http.Client();

    var endPoint =
        Uri.http('donasi.codehater.net', '/api/campaign/${keyword!}');
    var response = await http.get(
      endPoint,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Data campaign tidak ditemukan!');
    }

    var data = jsonDecode(response.body);
    Donation value = Donation.fromJSON(data['data']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Category>>> getCategory(
      {http.Client? client}) async {
    client ?? http.Client();

    var endPoint = Uri.http('donasi.codehater.net', '/api/category');
    var response = await http.get(
      endPoint,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again!');
    }

    var data = jsonDecode(response.body);
    List<Category> value = (data['data']['data'] as Iterable)
        .map((e) => Category.fromJSON(e))
        .toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Slider>>> getSlider(
      {http.Client? client}) async {
    client ?? http.Client();

    var endPoint = Uri.http('donasi.codehater.net', '/api/slider');
    var response = await http.get(
      endPoint,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again!');
    }

    var data = jsonDecode(response.body);
    List<Slider> value =
        (data['data'] as Iterable).map((e) => Slider.fromJSON(e)).toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Payment>>> getMyDonation(
      {http.Client? client}) async {
    client ?? http.Client();
    bool? token = await UserServices.checkToken();
    String? storeToken;
    if (!token) {
      return ApiReturnValue(message: 'History donasi tidak ada');
    } else {
      storeToken = await UserServices.getStoreToken();
    }
    var endPoint = Uri.http('donasi.codehater.net', '/api/donation');
    var response = await http.get(
      endPoint,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $storeToken',
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again!');
    }

    var data = jsonDecode(response.body);
    List<Payment> value = (data['data']['data'] as Iterable)
        .map((e) => Payment.fromJSON(e))
        .toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> payment(
      int? amount, String? doa, String? slug,
      {http.Client? client}) async {
    client ?? http.Client();
    String? token = await UserServices.getStoreToken();
    if (amount! < 10000) {
      return ApiReturnValue(message: 'Nominal minimal 10.000');
    }
    var endPoint = Uri.http('donasi.codehater.net', '/api/donation');
    var response = await http.post(endPoint,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'campaignSlug': slug!,
          'pray': doa,
          'amount': amount
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again!');
    }

    var data = jsonDecode(response.body);
    String value = data['0']['snap_token'];
    String link = 'https://app.sandbox.midtrans.com/snap/v2/vtweb/$value';

    return ApiReturnValue(value: link);
  }
}
