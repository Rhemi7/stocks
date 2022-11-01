import 'package:stock_data/features/data/model/stock_response.dart';
import 'package:http/http.dart' as http;

import '../../../constants/const.dart';
import '../../../core/error/failure.dart';

abstract class GetStockRemoteDataSource {
  Future<StockResponse> getStocks();
}

class GetStockRemoteDatasourceImpl implements GetStockRemoteDataSource {
  late final http.Client client;
  GetStockRemoteDatasourceImpl(this.client);

  @override
  Future<StockResponse> getStocks() async {
    var response = await client.get(
        Uri.parse('$baseUrl/eod/latest?access_key=$apikey&symbols=$symbols'),
        headers: headers);

    print(response.body);

    if (response.statusCode.toString().startsWith("2")) {
      var stockResponse = stockResponseFromJson(response.body);
      print(stockResponse);
      return stockResponse;
    } else {
      throw ServerException();
    }
  }
}
