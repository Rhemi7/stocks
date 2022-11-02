import 'package:dartz/dartz.dart';
import 'package:stock_data/core/error/failure.dart';
import 'package:stock_data/features/data/model/stock_response.dart';

import '../../data/model/stock_range_response.dart';

abstract class StockRepository {

  Future<Either<Failure, StockResponse>> getStock();
  Future<Either<Failure, StockRangeResponse>> getStockInRange({required String symbol, required String from, required String to});

}