import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_data/features/domain/usecases/get_stocks.dart';
import 'package:stock_data/features/domain/usecases/get_stocks_in_range.dart';

import '../../../service_locator.dart';
import '../notifier/get_stock/get_stock_notifier.dart';
import '../notifier/get_stock/get_stock_state.dart';
import '../notifier/get_stock_in_range/range_notifier.dart';
import '../notifier/get_stock_in_range/range_state.dart';

final getStockProvider = Provider<GetStocks>((ref) => GetStocks(sl()));

final getStocksNotifierProvider =
StateNotifierProvider<GetStockNotifier, GetStockState>(
        (ref) => GetStockNotifier(ref.watch(getStockProvider)));

final getStockRangeProvider = Provider<GetStocksInRange>((ref) => GetStocksInRange(sl()));

final getStocksRangeNotifierProvider =
StateNotifierProvider<GetStockRangeNotifier, GetStockRangeState>(
        (ref) => GetStockRangeNotifier(ref.watch(getStockRangeProvider)));