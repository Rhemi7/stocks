import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/usecases.dart';
import '../../data/model/stock_range_response.dart';
import '../repository/get_stock_repository.dart';

class GetStocksInRange extends UseCase<StockRangeResponse, RangeParams> {
  StockRepository stockRepository;
  GetStocksInRange(this.stockRepository);
  @override
  Future<Either<Failure, StockRangeResponse>> call(RangeParams params) async {
    return stockRepository.getStockInRange(from: params.from!, to: params.to!, symbol: params.symbols!).then((value) => value);
  }
}

class RangeParams {
  String? symbols;
  String? from;
  String? to;

  RangeParams({this.to, this.from, this.symbols});
}
