import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_data/features/domain/usecases/get_stocks.dart';

import '../../../service_locator.dart';
import '../notifier/get_stock/get_stock_notifier.dart';
import '../notifier/get_stock/get_stock_state.dart';

final getStockProvider = Provider<GetStocks>((ref) => GetStocks(sl()));

final getStocksNotifierProvider =
StateNotifierProvider<GetStockNotifier, GetStockState>(
        (ref) => GetStockNotifier(ref.watch(getStockProvider)));