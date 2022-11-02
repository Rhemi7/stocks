import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_data/features/data/datasources/get_stock_remote_datasource.dart';
import 'package:stock_data/features/data/model/pagination.dart';
import 'package:stock_data/features/data/model/stock_range_response.dart';
import 'package:stock_data/features/data/model/stock_response.dart';
import 'package:stock_data/features/data/repository/stock_repository_implementation.dart';

class MockGetStockRemoteDataSource extends Mock
    implements GetStockRemoteDataSource {}

void main() {
  late MockGetStockRemoteDataSource mockRemoteDataSource;
  late StockRepositoryImpl repository;

  mockRemoteDataSource = MockGetStockRemoteDataSource();
  repository = StockRepositoryImpl(
      mockRemoteDataSource);

  String symbol = "AAPL";
  String from = "2022-03-11";
  String to = "2022-03-13";

  group("Get Stock", () {
    final testStockModel = StockResponse(
        pagination: Pagination(limit: 100, offset: 0, count: 3, total: 3),
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
              date: "2022-11-01T00:00:00+0000"),
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
              date: "2022-11-01T00:00:00+0000")
        ]);

      test(
        'should return remote data when the call is successful',
            () async {
          // arrange
          when(mockRemoteDataSource.getStocks())
              .thenAnswer((_) async => testStockModel);
          // act
          final result = await repository.getStock();
          // assert
          verify(mockRemoteDataSource.getStocks());

          expect(result, equals(Right(testStockModel)));
        },
      );
    });

  group("Get Stock in Range", () {
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

    test(
      'should return remote data when the call is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getStockInRange(from: from, to: to, symbols: symbol))
            .thenAnswer((_) async => testStockModel);
        // act
        final result = await repository.getStockInRange(from: from, to: to, symbol: symbol);
        // assert
        verify(mockRemoteDataSource.getStockInRange(from: from, to: to, symbols: symbol));

        expect(result, equals(Right(testStockModel)));
      },
    );
  });
}