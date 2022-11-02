import 'package:flutter_test/flutter_test.dart';
import 'package:stock_data/constants/const.dart';
import 'package:stock_data/core/error/failure.dart';
import 'package:stock_data/features/data/datasources/get_stock_remote_datasource.dart';
import 'package:stock_data/features/data/model/stock_range_response.dart';
import 'package:stock_data/features/data/model/stock_response.dart';

import '../../../data/data_reader.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}
String symbol = "AAPL";
String from = "2022-03-11";
String to = "2022-03-13";

void main() {

  late MockClient client;
  late GetStockRemoteDatasourceImpl dataSource;

  var url = Uri.parse('$baseUrl/eod/latest?access_key=$apikey&symbols=${symbols.join(",")}');
  var rangeUrl = Uri.parse('$baseUrl/intraday?access_key=$apikey&symbols=$symbol&date_from=$from&date_to=$to');


  setUp(() {
    client = MockClient();
    dataSource = GetStockRemoteDatasourceImpl(client);
  });

  group('get stock', () {
    test('returns a stock response if the http call completes successfully',
            () async {
          when(client.get(url, headers: headers)).thenAnswer(
                  (_) async => http.Response(dataReader('stock_response.json'), 200));

          expect(await dataSource.getStocks(), isA<StockResponse>());
        });

    test('throws an exception if the http call results in an error', () {
      when(client.get(url, headers: headers))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => dataSource.getStocks(),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });


  group('get stock in range', () {
    test('returns a stock range response if the http call completes successfully',
            () async {
          when(client.get(rangeUrl, headers: headers)).thenAnswer(
                  (_) async => http.Response(dataReader('stock_range_response.json'), 200));

          expect(await dataSource.getStockInRange(symbols: symbol, from: from, to: to), isA<StockRangeResponse>());
        });

    test('throws an exception if the http call results in an error', () {
      when(client.get(rangeUrl, headers: headers))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => dataSource.getStockInRange(symbols: symbol, from: from, to: to),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });
}