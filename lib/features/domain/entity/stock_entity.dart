import 'package:equatable/equatable.dart';
import 'package:stock_data/features/data/model/stock_response.dart';

import '../../data/model/pagination.dart';

class StockEntity extends Equatable{
  StockEntity({
    this.pagination,
    this.data,
  });

  final Pagination? pagination;
  final List<StockData>? data;

  @override
  List<Object?> get props => [pagination, data];

}