import 'package:stock_data/features/data/model/stock_response.dart';

abstract class GetStockState {
  const GetStockState();
}

class GetStockInitial extends GetStockState {
  const GetStockInitial();
}

class GetStockLoading extends GetStockState {
  const GetStockLoading();
}

class GetStockLoaded extends GetStockState {
  final List<StockData>? data;
  GetStockLoaded({this.data});
}

class GetStockError extends GetStockState {
  String message;
  GetStockError({required this.message});
}