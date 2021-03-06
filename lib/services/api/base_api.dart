import 'package:dio/dio.dart';

abstract class BaseApi {
  Dio _dio = new Dio();
  Response _response;
  String reqUrl;

  Map<String, dynamic> getResponse(Response response);

  Future getQueryParameters() async {
    return {};
  }

  Future<Map<String, dynamic>> getRequest() async {
    try {
      _response = await _dio.get(
        reqUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (_response.statusCode == 400) {
        throw new Exception("Bad request");
      }
      if (_response.statusCode == 401) {
        throw new Exception("Unauthorized");
      }
      if (_response.statusCode == 404) {
        throw new Exception("Not found");
      }
      if (_response.statusCode == 500) {
        throw new Exception("Server error");
      }
      return getResponse(_response);
    } catch (e, stackTrace) {
      print("error :$e");
      return {'data': stackTrace, 'status': false};
    }
  }
}
