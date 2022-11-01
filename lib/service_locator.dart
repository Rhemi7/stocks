import 'package:get_it/get_it.dart';
import 'package:stock_data/features/data/datasources/get_stock_remote_datasource.dart';
import 'package:stock_data/features/data/repository/stock_repository_implementation.dart';
import 'package:stock_data/features/domain/repository/get_stock_repository.dart';
import 'package:stock_data/features/domain/usecases/get_stocks.dart';
import 'package:http/http.dart' as http;

GetIt sl = GetIt.instance;

Future<void> setUpLocator() async {
//Http Client
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<GetStockRemoteDataSource>(() => GetStockRemoteDatasourceImpl(sl()));

  sl.registerLazySingleton<StockRepository>(() => StockRepositoryImpl(sl()));

  sl.registerLazySingleton<GetStocks>(() => GetStocks(sl()));

}