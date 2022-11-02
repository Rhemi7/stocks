import 'package:stock_data/features/data/model/stock_range_response.dart';
import 'package:stock_data/features/data/model/stock_response.dart';
import 'package:http/http.dart' as http;

import '../../../constants/const.dart';
import '../../../core/error/failure.dart';

abstract class GetStockRemoteDataSource {
  Future<StockResponse> getStocks();
  Future<StockRangeResponse> getStockInRange({String? symbols, String? from, String? to});
}

class GetStockRemoteDatasourceImpl implements GetStockRemoteDataSource {
  late final http.Client client;
  GetStockRemoteDatasourceImpl(this.client);

  @override
  Future<StockResponse> getStocks() async {
    var response = await client.get(
        Uri.parse(
            '$baseUrl/eod/latest?access_key=$apikey&symbols=${symbols.join(",")}'),
        headers: headers);

    if (response.statusCode.toString().startsWith("2")) {
      var stockResponse = stockResponseFromJson(response.body);
      return stockResponse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<StockRangeResponse> getStockInRange(
      {String? symbols, String? from, String? to}) async {
    var response = await client.get(
        Uri.parse(
            '$baseUrl/intraday?access_key=$apikey&symbols=$symbols&date_from=$from&date_to=$to'),
        headers: headers);


    if (response.statusCode.toString().startsWith("2")) {
      var stockResponse = stockRangeResponseFromJson(response.body);

      return stockResponse;
    } else {
      throw ServerException();
    }
  }
}
