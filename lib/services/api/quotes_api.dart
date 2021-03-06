import 'package:dio/dio.dart';
import 'package:quotes/model/quotes_model.dart';

import 'api_urls.dart';
import 'base_api.dart';

class QuotesApi extends BaseApi {
  String reqUrl = ApiUrls.quotes;

  Future fetchQuotesApi() async {
    final Map<String, dynamic> _response = await getRequest();
    return _response;
  }

  @override
  Map<String, dynamic> getResponse(Response response) {
    Map<String, dynamic> _responseData = response.data;

    QuotesModel quote = QuotesModel.fromJson(_responseData);
    return {'data': quote, 'status': true};
  }
}
