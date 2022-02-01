import 'dart:convert';

import 'package:http/http.dart' as http;

class Response {
  int statusCode;
  Map<String, dynamic>? content;
  Exception? exception;

  Response({required this.statusCode, this.content, this.exception});

  bool get success => statusCode == 200;
}

class HttpService {
  final _client = http.Client();

  Future<Response> getRequest(String uri) async {
    var httpResponse = await _client.get(Uri.parse(uri));
    return _parseHttpResponse(httpResponse);
  }

  Response _parseHttpResponse(http.Response httpResponse) {
    Response response;
    try {
      response = Response(
          statusCode: httpResponse.statusCode,
          content: jsonDecode(
            httpResponse.body,
          ));
    } on Exception catch (e) {
      response = Response(statusCode: httpResponse.statusCode, exception: e);
    }
    return response;
  }
}
