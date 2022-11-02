import 'package:equatable/equatable.dart';

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