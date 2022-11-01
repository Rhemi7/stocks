import 'package:stock_data/features/data/model/stock_range_response.dart';

abstract class GetStockRangeState {
  const GetStockRangeState();
}

class GetStockRangeInitial extends GetStockRangeState {
  const GetStockRangeInitial();
}

class GetStockRangeLoading extends GetStockRangeState {
  const GetStockRangeLoading();
}

class GetStockRangeLoaded extends GetStockRangeState {
  final List<RangeStockData>? data;
  GetStockRangeLoaded({this.data});
}

class GetStockRangeError extends GetStockRangeState {
  String message;
  GetStockRangeError({required this.message});
}