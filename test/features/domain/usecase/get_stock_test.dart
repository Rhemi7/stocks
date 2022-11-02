import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_data/core/usecase/usecases.dart';
import 'package:stock_data/features/data/model/pagination.dart';
import 'package:stock_data/features/data/model/stock_response.dart';
import 'package:stock_data/features/domain/repository/get_stock_repository.dart';
import 'package:stock_data/features/domain/usecases/get_stocks.dart';

class MockStockRepository extends Mock implements StockRepository {}

void main() {

  MockStockRepository repository;
  GetStocks usecase;

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
    'should get stock response from the repository',
        () async {
      repository = MockStockRepository();
      usecase = GetStocks(repository);
      //stub the method
      when(repository.getStock()).thenAnswer((_) async => Right(testStockModel));
      // act
      final result = await usecase( NoParams());
      // assert
      expect(result, Right(testStockModel));
      verify(repository.getStock());
      verifyNoMoreInteractions(repository);
    },
  );
}