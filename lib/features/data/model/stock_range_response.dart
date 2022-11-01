// To parse this JSON data, do
//
//     final stockRangeResponse = stockRangeResponseFromJson(jsonString);

import 'dart:convert';

StockRangeResponse stockRangeResponseFromJson(String str) => StockRangeResponse.fromJson(json.decode(str));

String stockRangeResponseToJson(StockRangeResponse data) => json.encode(data.toJson());

class StockRangeResponse {
  StockRangeResponse({
    this.pagination,
    this.data,
  });

  final Pagination? pagination;
  final List<RangeStockData>? data;

  factory StockRangeResponse.fromJson(Map<String, dynamic> json) => StockRangeResponse(
    pagination: Pagination.fromJson(json["pagination"]),
    data: List<RangeStockData>.from(json["data"].map((x) => RangeStockData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination!.toJson(),
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class RangeStockData {
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

  final double? open;
  final double? high;
  final double? low;
  final dynamic last;
  final double? close;
  final dynamic volume;
  final String? date;
  final Symbol? symbol;
  final String? exchange;

  factory RangeStockData.fromJson(Map<String, dynamic> json) => RangeStockData(
    open: json["open"].toDouble(),
    high: json["high"].toDouble(),
    low: json["low"].toDouble(),
    last: json["last"],
    close: json["close"].toDouble(),
    volume: json["volume"],
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
}


class Pagination {
  Pagination({
    this.limit,
    this.offset,
    this.count,
    this.total,
  });

  final int? limit;
  final int ?offset;
  final int ?count;
  final int ?total;

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
}


