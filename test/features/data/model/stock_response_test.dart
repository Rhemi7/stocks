import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:stock_data/features/data/model/stock_response.dart';

import '../../../data/data_reader.dart';



void main() {
  final testStockModel = StockResponse(
    pagination: Pagination(
        limit: 100,
        offset: 0,
        count: 3,
        total: 3
    ),
    data: [
      StockData(
          open: 155.08,
          high: 155.45,
          low: 149.14,
          close: 150.65,
          volume: 80379345.0,
          adjHigh: 155.45,
          adjLow: 149.13,
          adjClose: 150.65,
          adjOpen: 155.08,
          adjVolume: 80379345.0,
          splitFactor: 1.0,
          dividend: 0.0,
          symbol: "AAPL",
          exchange: "XNAS",
          date: "2022-11-01T00:00:00+0000"
      ),
      StockData(
          open: 155.08,
          high: 155.45,
          low: 149.14,
          close: 150.65,
          volume: 80379345.0,
          adjHigh: 155.45,
          adjLow: 149.13,
          adjClose: 150.65,
          adjOpen: 155.08,
          adjVolume: 80379345.0,
          splitFactor: 1.0,
          dividend: 0.0,
          symbol: "AAPL",
          exchange: "XNAS",
          date: "2022-11-01T00:00:00+0000"
      )
    ]
      );

  test("Should be a subclass of Stock response", () async {
    expect(testStockModel, isA<StockResponse>());
  });

  group('fromJson', () {
    test(
      'should return a valid model when fromJson is called',
          () async {
        final jsonString = dataReader('stock_response.json');
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        final result = StockResponse.fromJson(jsonMap);
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
            "count": 3,
            "total": 3
          },
          "data": [
            {
              "open": 155.08,
              "high": 155.45,
              "low": 149.14,
              "close": 150.65,
              "volume": 80379345.0,
              "adj_high": 155.45,
              "adj_low": 149.13,
              "adj_close": 150.65,
              "adj_open": 155.08,
              "adj_volume": 80379345.0,
              "split_factor": 1.0,
              "dividend": 0.0,
              "symbol": "AAPL",
              "exchange": "XNAS",
              "date": "2022-11-01T00:00:00+0000"
            },
            {
              "open": 155.08,
              "high": 155.45,
              "low": 149.14,
              "close": 150.65,
              "volume": 80379345.0,
              "adj_high": 155.45,
              "adj_low": 149.13,
              "adj_close": 150.65,
              "adj_open": 155.08,
              "adj_volume": 80379345.0,
              "split_factor": 1.0,
              "dividend": 0.0,
              "symbol": "AAPL",
              "exchange": "XNAS",
              "date": "2022-11-01T00:00:00+0000"
            }
          ]
        };
        expect(result, expectedMap);
      },
    );
  });
}