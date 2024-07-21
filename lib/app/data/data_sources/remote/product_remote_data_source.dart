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
  Future<ProductResponseModel> getProducts(params) {
    return _getProductFromUrl(
        '$baseUrl/products?keyword=${params.keyword}&pageSize=${params.pageSize}&page=${params.limit}'
            '&category_id=${params.categories.isEmpty ? 0: params.categories.first.id}');
  }

  Future<ProductResponseModel> _getProductFromUrl(String url) async {
    print('test api 1 check: $url');
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
      print('test api 1 check: $url');
      throw ServerException();
    }
  }
}
