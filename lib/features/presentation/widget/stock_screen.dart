import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_data/features/data/model/stock_response.dart';
import 'package:stock_data/features/presentation/widget/stock_card.dart';

import '../notifier/get_stock_in_range/range_state.dart';
import '../provider/providers.dart';

class StockScreen extends ConsumerStatefulWidget {
  final String from;
  final String to;
  final String symbol;
  const StockScreen(
      {Key? key, required this.symbol, required this.from, required this.to})
      : super(key: key);

  @override
  ConsumerState<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends ConsumerState<StockScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(getStocksRangeNotifierProvider.notifier).getStockRange(
          from: widget.from, to: widget.to, symbol: widget.symbol);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE6E6E6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final state = ref.watch(getStocksRangeNotifierProvider);
                    if (state is GetStockRangeLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetStockRangeLoaded) {
                      return ListView(
                        children: state.data!
                            .map((e) => StockCard(
                                  data: StockData(
                                      open: e.open,
                                      close: e.close,
                                      high: e.high,
                                      low: e.low,
                                      symbol: e.symbol,
                                      exchange: e.exchange,
                                      date: e.date),
                                ))
                            .toList(),
                      );
                    } else if (state is GetStockRangeError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
