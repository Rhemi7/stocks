import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_data/features/data/model/stock_response.dart';
import 'package:stock_data/features/domain/usecases/get_stocks.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecases.dart';
import 'get_stock_state.dart';

class GetStockNotifier extends StateNotifier<GetStockState> {
  List<StockData>? sData;
  GetStocks getStocks;
  GetStockNotifier(this.getStocks) : super(const GetStockInitial());

  getStock() async {
    state = const GetStockLoading();

    var result = await getStocks(NoParams());
    result.fold((failure) {
      state = GetStockError(message: mapFailureToMessage(failure));
    }, (r) {
      sData = r.data;
      state = GetStockLoaded(data: r.data);

    });
  }

  // var currentState() {
  //   return state;
  // }
}