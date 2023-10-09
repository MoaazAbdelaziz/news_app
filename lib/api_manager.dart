import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api_constants.dart';
import 'package:news_app/models/sources_response/sources_response.dart';

class ApiManger {
  static Future<SourceResponse> getSources() async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.sourceApi,
      {
        'apiKey': '1f0d0f4ab962404886dbcaf080d6cb2b',
      },
    );
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var jsonData = jsonDecode(bodyString);
      return SourceResponse.fromJson(jsonData);
    } catch (e) {
      rethrow;
    }
  }
}
