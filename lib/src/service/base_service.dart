abstract class BaseService{
  final String baseUrl = 'https://naqshsoft.site';
  final String apiToken = '';

  Future<dynamic> getResponse(String url);
}