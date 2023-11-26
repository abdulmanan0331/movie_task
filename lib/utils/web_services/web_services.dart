import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_task/all_utils.dart';

import 'api_constants.dart';

class WebServices {
  static Future<List<MovieModel>?> apiRequest<T>({
    Map<String, dynamic>? bodyMap,
    Map<String, dynamic>? queryParams,
    bool isPost = false,
  }) async {
    const requestURL = 'https://api.themoviedb.org/3/movie/popular';
    final headerMap = {
      'Content-Type': 'application/json',
    };

    try {
      final uri = Uri.parse(requestURL).replace(queryParameters: {
        'api_key': 'f748c18feeac7aa59b7acd9cb68ad8c5',
      });

      final response = isPost
          ? await http.post(uri, headers: headerMap, body: jsonEncode(bodyMap))
          : await http.get(uri, headers: headerMap);

      if (ApiConstants.isDebugging) {
        print(
            "Request URL: $requestURL\nRequest Params: $bodyMap\nHeaders: $headerMap\nResponse body: ${response.body}");
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parsedResponse = json.decode(response.body);
        List<dynamic> movieList = parsedResponse['results'] ?? [];
        return movieList.map((e) => MovieModel.fromJson(e)).toList();
      } else {
        EasyLoading.showInfo(response.statusCode.toString());
        return null;
      }
    } catch (exception) {
      // Capture and return the exception message.
      EasyLoading.showInfo(exception.toString());
      return null;
    }
  }
}
