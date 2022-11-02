// To parse this JSON data, do
//
//     final stockResponse = stockResponseFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/entity/stock_entity.dart';

StockResponse stockResponseFromJson(String str) =>
    StockResponse.fromJson(json.decode(str));

String stockResponseToJson(StockResponse data) => json.encode(data.toJson());

class StockResponse extends StockEntity {
  StockResponse({
    this.pagination,
    this.data,
  });

  final Pagination? pagination;
  final List<StockData>? data;

  factory StockResponse.fromJson(Map<String, dynamic> json) => StockResponse(
        pagination: Pagination.fromJson(json["pagination"]),
        data: List<StockData>.from(
            json["data"].map((x) => StockData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination!.toJson(),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StockData extends Equatable {
  StockData({
    this.open,
    this.high,
    this.low,
    this.close,
    this.volume,
    this.adjHigh,
    this.adjLow,
    this.adjClose,
    this.adjOpen,
    this.adjVolume,
    this.splitFactor,
    this.dividend,
    this.symbol,
    this.exchange,
    this.date,
  });

  final num? open;
  final num? high;
  final num? low;
  final num? close;
  final num? volume;
  final dynamic? adjHigh;
  final dynamic? adjLow;
  final num? adjClose;
  final dynamic? adjOpen;
  final dynamic? adjVolume;
  final num? splitFactor;
  final num? dividend;
  final String? symbol;
  final String? exchange;
  final String? date;

  factory StockData.fromJson(Map<String, dynamic> json) => StockData(
        open: json["open"].toDouble(),
        high: json["high"].toDouble(),
        low: json["low"].toDouble(),
        close: json["close"].toDouble(),
        volume: json["volume"],
        adjHigh: json["adj_high"],
        adjLow: json["adj_low"],
        adjClose: json["adj_close"].toDouble(),
        adjOpen: json["adj_open"],
        adjVolume: json["adj_volume"],
        splitFactor: json["split_factor"],
        dividend: json["dividend"],
        symbol: json["symbol"],
        exchange: json["exchange"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "open": open,
        "high": high,
        "low": low,
        "close": close,
        "volume": volume,
        "adj_high": adjHigh,
        "adj_low": adjLow,
        "adj_close": adjClose,
        "adj_open": adjOpen,
        "adj_volume": adjVolume,
        "split_factor": splitFactor,
        "dividend": dividend,
        "symbol": symbol,
        "exchange": exchange,
        "date": date,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        open,
        high,
        low,
        close,
        volume,
        adjClose,
        adjHigh,
        adjLow,
        adjOpen,
        adjVolume,
        dividend,
        symbol,
        exchange,
        date,
    splitFactor
      ];
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
