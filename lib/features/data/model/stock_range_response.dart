// To parse this JSON data, do
//
//     final stockRangeResponse = stockRangeResponseFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:stock_data/features/domain/entity/stock_range_emtity.dart';

StockRangeResponse stockRangeResponseFromJson(String str) =>
    StockRangeResponse.fromJson(json.decode(str));

String stockRangeResponseToJson(StockRangeResponse data) =>
    json.encode(data.toJson());

class StockRangeResponse extends StockRangeEntity{
  StockRangeResponse({
    this.pagination,
    this.data,
  });

  final Pagination? pagination;
  final List<RangeStockData>? data;

  factory StockRangeResponse.fromJson(Map<String, dynamic> json) =>
      StockRangeResponse(
        pagination: Pagination.fromJson(json["pagination"]),
        data: List<RangeStockData>.from(
            json["data"].map((x) => RangeStockData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination!.toJson(),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RangeStockData extends Equatable{
  RangeStockData({
    this.open,
    this.high,
    this.low,
    this.last,
    this.close,
    this.volume,
    this.date,
    this.symbol,
    this.exchange,
  });

  final num? open;
  final num? high;
  final num? low;
  final dynamic last;
  final num? close;
  final dynamic volume;
  final String? date;
  final String? symbol;
  final String? exchange;

  factory RangeStockData.fromJson(Map<String, dynamic> json) => RangeStockData(
        open: json["open"] == null ? null : json["open"].toDouble(),
        high: json["high"] == null ? null : json["high"].toDouble(),
        low: json["low"] == null ? null : json["low"].toDouble(),
        last: json["last"] == null ? null : json["last"].toDouble(),
        close: json["close"] == null ? null : json["close"].toDouble(),
        volume: json["volume"] == null ? null : json["volume"],
        date: json["date"],
        symbol: json["symbol"],
        exchange: json["exchange"],
      );

  Map<String, dynamic> toJson() => {
        "open": open,
        "high": high,
        "low": low,
        "last": last,
        "close": close,
        "volume": volume,
        "date": date,
        "symbol": symbol,
        "exchange": exchange,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [open, high, low, last, close, volume, date, symbol, exchange];
}

class Pagination extends Equatable{
  Pagination({
    this.limit,
    this.offset,
    this.count,
    this.total,
  });

  final int? limit;
  final int? offset;
  final int? count;
  final int? total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        limit: json["limit"],
        offset: json["offset"],
        count: json["count"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "offset": offset,
        "count": count,
        "total": total,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [limit, offset, count, total];
}
