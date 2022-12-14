import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_data/features/domain/usecases/get_stocks_in_range.dart';
import 'package:stock_data/features/presentation/notifier/get_stock_in_range/range_state.dart';

import '../../../../core/error/failure.dart';

class GetStockRangeNotifier extends StateNotifier<GetStockRangeState> {
  GetStocksInRange getStocksRange;
  GetStockRangeNotifier(this.getStocksRange)
      : super(const GetStockRangeInitial());

  getStockRange(
      {required String symbol,
      required String to,
      required String from}) async {
    state = const GetStockRangeLoading();

    var result = await getStocksRange(RangeParams(
      from: from, to: to, symbols: symbol
    ));
    result.fold((failure) {
      state = GetStockRangeError(message: mapFailureToMessage(failure));
    }, (r) {
      state = GetStockRangeLoaded(data: r.data);
    });
  }

// var currentState() {
//   return state;
// }
}
