part of 'services.dart';

class DonationServices {
  static Future<ApiReturnValue<Donation>> getCampaign(
      {http.Client? client}) async {
    client ?? http.Client();

    var endPoint = Uri.http('donasi.codehater.net', '/api/campaign');
    var response = await http.post(
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
    Donation value = Donation.fromJSON(data['data']['data']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<Category>> getCategory(
      {http.Client? client}) async {
    client ?? http.Client();

    var endPoint = Uri.http('donasi.codehater.net', '/api/category');
    var response = await http.post(
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
    Category value = Category.fromJSON(data['data']);

    return ApiReturnValue(value: value);
  }
}
