import 'package:e_commerce_food_app/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
    late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    // GetX package management system should know your base url
    // you pass to it this one
    baseUrl = appBaseUrl;
    // each time you make a request so how long the request
    // should try and after that it should continue or not
    // then it tries to request or get data for 30 seconds
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    /// why we have these api headers and client?
    /// used to talk to the server
    /// and each time you talk to the server you need a url and headers
    _mainHeaders = {
      // to request and post data in json format
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': /*token type*/ 'Bearer $token',
    };
  }

  // simple request of getting data from server
  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
}
