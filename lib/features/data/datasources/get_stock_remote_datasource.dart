import 'package:stock_data/features/data/model/stock_range_response.dart';
import 'package:stock_data/features/data/model/stock_response.dart';
import 'package:http/http.dart' as http;

import '../../../constants/const.dart';
import '../../../core/error/failure.dart';

abstract class GetStockRemoteDataSource {
  Future<StockResponse> getStocks();
  Future<StockRangeResponse> getStockInRange();
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

  @override
  Future<StockRangeResponse> getStockInRange({String? symbols, String? from, String? to}) async {
    //http://api.marketstack.com/v1/intraday?access_key=74b29c99a1133061fdcd5183b7c03e54&symbols=AAPL,GOOGL&date_from=2020-05-21&date_to=2020-05-28
    var response = await client.get(
        Uri.parse('$baseUrl/intraday?access_key=$apikey&symbols=$symbols&date_from=$from&date_to=$to'),
        headers: headers);

    if (response.statusCode.toString().startsWith("2")) {
      var stockResponse = stockRangeResponseFromJson(response.body);
      return stockResponse;
    } else {
      throw ServerException();
    }
  }
}
