import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_data/features/domain/usecases/get_stocks.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecases.dart';
import 'get_stock_state.dart';

class GetStockNotifier extends StateNotifier<GetStockState> {
  GetStocks getStocks;
  GetStockNotifier(this.getStocks) : super(const GetStockInitial());

  getStock() async {
    state = const GetStockLoading();

    var result = await getStocks(NoParams());
    result.fold((failure) {
      state = GetStockError(message: mapFailureToMessage(failure));
    }, (r) {
      state = GetStockLoaded(data: r.data);
    });
  }
}