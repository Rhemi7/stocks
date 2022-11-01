import 'package:dartz/dartz.dart';
import 'package:stock_data/core/error/failure.dart';
import 'package:stock_data/core/usecase/usecases.dart';
import 'package:stock_data/features/data/model/stock_response.dart';
import 'package:stock_data/features/domain/repository/get_stock_repository.dart';

class GetStocks extends UseCase<StockResponse, NoParams> {
  StockRepository stockRepository;
  GetStocks(this.stockRepository);
  @override
  Future<Either<Failure, StockResponse>> call(NoParams params) async {
    return stockRepository.getStock().then((value) => value);
  }
}
