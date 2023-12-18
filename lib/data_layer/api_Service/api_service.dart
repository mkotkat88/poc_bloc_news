import 'dart:convert';
import 'dart:io';
import 'package:poc_bloc_new/data_layer/api_Service/endPoints.dart';

import '../../data_layer/api_Service//custom_exception.dart';
import '../../data_layer/api_Service/base_api_service.dart';
import 'package:http/http.dart' as http;

class ApiService extends BaseApiService {


  dynamic getResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        throw UnauthorisedException(responseJson['message']);
      case 500:
      default:
        throw FetchDataException(
            'Error connecting to server code : ${response.statusCode}');
    }
  }

  @override
  Future getAllNews(String url, String countryCode, int pageSize, int page) async {
    dynamic responseJson;
    try {
        var query = {
          "apiKey": apiKey,
          "country": countryCode,
          "pageSize": pageSize.toString(),
          "page": page.toString()
        };
        var uri = Uri.http(EndPoints.baseUrl, url, query);

        final response = await http.get(uri);
        responseJson = getResponse(response);
    } catch(e) {
      if(e is CustomException) {
        throw FetchDataException(e.toString());
      } else if(e is SocketException){
        throw FetchDataException("Socket Exception: ${e.toString()}");
      } else {
        throw FetchDataException("Something went wrong: ${e.toString()}");
      }
    }
    return responseJson;
  }

}