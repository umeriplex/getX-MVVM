abstract class BaseApiServices{


  Future<dynamic> getAPI(String url);
  Future<dynamic> postAPI(String url, dynamic body);

  // Future<dynamic> put(String url, dynamic body);
  // Future<dynamic> delete(String url);
}