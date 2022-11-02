import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_data/features/data/model/stock_response.dart';
import 'package:stock_data/features/presentation/notifier/get_stock/get_stock_state.dart';
import 'package:stock_data/features/presentation/provider/providers.dart';
import 'package:stock_data/features/presentation/widget/app_textfield.dart';

import '../widget/stock_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<StockData>? stocks = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(getStocksNotifierProvider.notifier).getStock();
    });
    searchController.addListener(() {
      stocks = ref
          .watch(getStocksNotifierProvider.notifier)
          .sData
          ?.where((element) =>
              element.symbol!.toLowerCase().contains(searchController.text))
          .toList();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextfield(
                  hint: "Search",
                    controller: searchController, onChanged: (val) {}),
              ),
              searchController.text.isNotEmpty
                  ? Expanded(
                      flex: 11,
                      child: ListView(
                        children: stocks!
                            .map((e) => StockCard(
                                  data: e,
                                ))
                            .toList(),
                      ),
                    )
                  : Expanded(
                      child: Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          final state = ref.watch(getStocksNotifierProvider);
                          if (state is GetStockLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is GetStockLoaded) {
                            return ListView(
                              children: state.data!
                                  .map((e) => StockCard(
                                        data: e,
                                      ))
                                  .toList(),
                            );
                          } else if (state is GetStockError) {
                            return const Center(
                              child: Text("An error occurred"),
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


