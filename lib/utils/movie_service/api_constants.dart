import 'package:flutter/foundation.dart' as Foundation;

class ApiConstants {
  static const isDebugging = Foundation.kDebugMode;
  static String internetNotAvailableMessage =
      "Internet not available Please try Again";
  static String serverError = "Server Error";

  static const String apiKey = 'f748c18feeac7aa59b7acd9cb68ad8c5';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String movieApi = '/movie/popular';
}
