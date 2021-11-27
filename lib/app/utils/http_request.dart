import 'package:http/http.dart' as http;
import 'package:whats_app_clone/app/config/enums.dart';

class MyHttpClient {
  // 1
  static const String _baseUrl = "https://developdev.com/api";
  String token = '';
  // 2
  final http.Client _client = http.Client();
  // 3
  Future<http.Response> request({
    required RequestType requestType,
    required String path,
    required Map<String, dynamic>? body,
    required Map<String, String>? headers,
  }) async {
    // debugPrint('-------------requestType will send => $requestType');
    // debugPrint('-------------path will send => $path');
    // debugPrint('-------------parameter will send => ${parameter.runtimeType}');

    // String token = await UserPreferences().getUserToken();

    // UserPreferences().getUserToken().then(
    //   (value) {
    //     if (value == null) {
    //       debugPrint('MY_HTTP => token is null');
    //       token = '';
    //     } else {
    //       debugPrint('MY_HTTP => token valid: $value');
    //       token = value as String;
    //     }
    //   },
    // );
    // debugPrint('token111 in http => $token');

    switch (requestType) {
      case RequestType.GET:
        return _client.get(Uri.parse("$_baseUrl/$path"), headers: headers);
      case RequestType.DELETE:
        return _client.delete(
          Uri.parse("$_baseUrl/$path"),
          headers: headers,
        );
      case RequestType.POST:
        return _client.post(
          Uri.parse("$_baseUrl/$path"),
          body: body,
          headers: headers,
        );
      default:
        throw http.ClientException("The HTTP request method is not found");
    }
  }
}
