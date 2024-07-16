import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/error/exceptions.dart';
import '../../../core/utils/strings.dart';
import '../../../domain/use_case/product/get_product_usecase.dart';
import '../../models/product/product_response_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductResponseModel> getProducts(FilterProductParams params);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductResponseModel> getProducts(params) => _getProductFromUrl(
      '$baseUrl/products?keyword=${params.keyword}&pageSize=${params.pageSize}&page=${params.limit}&categories=${jsonEncode(params.categories.map((e) => e.id).toList())}');

  Future<ProductResponseModel> _getProductFromUrl(String url) async {
    print('test api 1');
    dynamic response;
    try{
      response = await client.get(
        Uri.parse(url),
      );
    } catch(e){
      print('Error: ${e.toString()}');
    }
    if (response.statusCode == 200) {
      return productResponseModelFromJson(response.body);
    }
    else {
      throw ServerException();
    }
  }
}
