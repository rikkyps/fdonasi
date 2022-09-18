import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

part 'user_services.dart';
part 'donation_services.dart';

String baseUrl = 'http://donasi.codehater.net/api/';
