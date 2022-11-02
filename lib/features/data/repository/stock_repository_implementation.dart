import 'package:dartz/dartz.dart';
import 'package:stock_data/core/error/failure.dart';
import 'package:stock_data/features/data/datasources/get_stock_remote_datasource.dart';
import 'package:stock_data/features/data/model/stock_range_response.dart';
import 'package:stock_data/features/data/model/stock_response.dart';
import 'package:stock_data/features/domain/repository/get_stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  GetStockRemoteDataSource remoteDataSource;
  StockRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, StockResponse>> getStock() async {
    try {
      final remoteStocks = await remoteDataSource.getStocks();
      return Right(remoteStocks);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StockRangeResponse>> getStockInRange(
      {required String symbol,
      required String from,
      required String to}) async {
    try {
      final remoteStocks = await remoteDataSource.getStockInRange(
          from: from, to: to, symbols: symbol);
      return Right(remoteStocks);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
