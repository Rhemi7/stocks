import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:stock_data/features/data/model/stock_range_response.dart';
import '../../../data/data_reader.dart';

void main() {
  final testStockModel = StockRangeResponse(
      pagination: Pagination(
          limit: 100,
          offset: 0,
          count: 2,
          total: 2
      ),
      data: [
        RangeStockData(
            open: 318.17,
            high: 319.135,
            low: 317.32,
            last: null,
            close: 318.7,
            volume: null,
            date: "2020-05-22T23:00:00+0000",
            symbol: "AAPL",
            exchange: "IEXG"
        ),
        RangeStockData(
            open: 318.17,
            high: 319.135,
            low: 317.32,
            last: null,
            close: 318.7,
            volume: null,
            date: "2020-05-22T23:00:00+0000",
            symbol: "AAPL",
            exchange: "IEXG"
        )
      ]
  );

  test("Should be a subclass of Stock response", () async {
    expect(testStockModel, isA<StockRangeResponse>());
  });

  group('fromJson', () {
    test(
      'should return a valid model when fromJson is called',
          () async {
        final jsonString = dataReader('stock_range_response.json');
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        final result = StockRangeResponse.fromJson(jsonMap);
        expect(result, testStockModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
          () async {
        // act
        final result = testStockModel.toJson();
        // assert
        final expectedMap = {
          "pagination": {
            "limit": 100,
            "offset": 0,
            "count": 2,
            "total": 2
          },
          "data": [
            {
              "open": 318.17,
              "high": 319.135,
              "low": 317.32,
              "last": null,
              "close": 318.7,
              "volume": null,
              "date": "2020-05-22T23:00:00+0000",
              "symbol": "AAPL",
              "exchange": "IEXG"
            },
            {
              "open": 318.17,
              "high": 319.135,
              "low": 317.32,
              "last": null,
              "close": 318.7,
              "volume": null,
              "date": "2020-05-22T23:00:00+0000",
              "symbol": "AAPL",
              "exchange": "IEXG"
            }
          ]
        };
        expect(result, expectedMap);
      },
    );
  });
}