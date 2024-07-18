import 'package:http/http.dart' as http;
import '../../../core/error/failures.dart';
import '../../../core/utils/strings.dart';
import '../../models/category/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final http.Client client;
  CategoryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CategoryModel>> getCategories() =>
      _getCategoryFromUrl('$baseUrl/categories?page=1&limit=10');

  Future<List<CategoryModel>> _getCategoryFromUrl(String url) async {
    print('test api _getCategoryFromUrl');
    String token ='eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjAyMDIyMDAyIiwidXNlcklkIjo5LCJzdWIiOiIwMjAyMjAwMiIsImV4cCI6MTcyMDM3NTYyN30.6UE4_LqLGLlzYeEh4BTAZ6bovDsukXT_lulMkwJA3sM';
    dynamic response;
    try{
      response = await client.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      print('Check Response: ${(response)}');
    } catch(e){
      print('Error: ${e.toString()}');
    }
    if (response.statusCode == 200) {
      return categoryModelListFromRemoteJson(response.body);
    } else {
      throw ServerFailure();
    }
  }
}
