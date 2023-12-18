
import '../data_layer/api_Service/endPoints.dart';
import '../data_layer/api_Service/base_api_service.dart';
import '../data_layer/api_Service/api_service.dart';
import 'base_repository.dart';

class BaseRepositoryImp extends BaseRepository {

  final BaseApiService _apiService = ApiService();
  static const int _pageSize = 10;

  @override
  Future getNewsData(String countryCode, int page) async {
    try {
      dynamic response = await _apiService.getAllNews(EndPoints.getNews, countryCode,_pageSize,page);
      return response;
    } catch(e) {
      rethrow;
    }
  }


}