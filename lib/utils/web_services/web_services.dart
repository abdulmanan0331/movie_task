import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'api_constants.dart';

class WebServices {
  static Future<T?> apiRequest<T>({
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
        return parsedResponse as T;
      } else if (response.statusCode == 404) {
        EasyLoading.showInfo('Resource not found');
        return null;
      } else {
        final bodyResponse = jsonDecode(response.body);
        if (bodyResponse['message'] == 'Unauthorized') {
          EasyLoading.showInfo('InValid Credential');
        } else {
          EasyLoading.showInfo(
              'Request failed  ${bodyResponse['message'] ?? 'Some Thing Happen'}');
        }

        return null;
      }
    } catch (exception) {
      // Capture and return the exception message.
      EasyLoading.showInfo(exception.toString());
      return null;
    }
  }
}
