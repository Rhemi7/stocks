import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_data/features/data/model/pagination.dart';
import 'package:stock_data/features/data/model/stock_range_response.dart';
import 'package:stock_data/features/domain/repository/get_stock_repository.dart';
import 'package:stock_data/features/domain/usecases/get_stocks_in_range.dart';

class MockStockRepository extends Mock implements StockRepository {}

void main() {

  MockStockRepository repository;
  GetStocksInRange usecase;

  String symbol = "AAPL";
  String from = "2022-03-11";
  String to = "2022-03-13";

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
    'should get stock range response from the repository',
        () async {
      repository = MockStockRepository();
      usecase = GetStocksInRange(repository);
      //stub the method
      when(repository.getStockInRange(from: from, to: to, symbol: symbol)).thenAnswer((_) async => Right(testStockModel));
      // act
      final result = await usecase(RangeParams(
        to: to,
        from: from,
        symbols: symbol
      ));
      // assert
      expect(result, Right(testStockModel));
      verify(repository.getStockInRange(from: from, to: to, symbol: symbol));
      verifyNoMoreInteractions(repository);
    },
  );
}