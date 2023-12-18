abstract class BaseApiService {
  final String apiKey = "ded6c7fb85394b699b18ddf7d20a85e6";

  Future<dynamic> getAllNews(String url, String countryCode, int pageSize, int page);
}