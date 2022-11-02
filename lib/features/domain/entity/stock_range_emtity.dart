import 'package:equatable/equatable.dart';

import '../../data/model/pagination.dart';
import '../../data/model/stock_range_response.dart';

class StockRangeEntity extends Equatable{
  StockRangeEntity({
    this.pagination,
    this.data,
  });

  final Pagination? pagination;
  final List<RangeStockData>? data;

  @override
  List<Object?> get props => [pagination, data];

}