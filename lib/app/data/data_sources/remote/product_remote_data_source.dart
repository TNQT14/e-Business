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
      '$baseUrl/products');

  Future<ProductResponseModel> _getProductFromUrl(String url) async {
    print('test api 1');
    dynamic response;
    try{
      response = await client.get(
        Uri.parse(url),
      );
      // print('Test ${response.body}');
      print('Test 1: ${json.encode(json.decode(utf8.decode(response.bodyBytes))["products"])}');
      print('Test 2 ${productResponseModelFromJson(response.body)}');
    } catch(e){
      // print('Error ${productResponseModelFromJson(response.body)}');
      print('Error: ${e.toString()}');
    }
    print('Test ${productResponseModelFromJson(response.body)}');
    if (response.statusCode == 200) {
      print('Test 200 ${productResponseModelFromJson(response.body)}');
      return productResponseModelFromJson(response.body);
    }
    else {
      print('Error here');
      throw ServerException();
    }
  }
}
