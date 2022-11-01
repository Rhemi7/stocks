import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_data/features/data/model/stock_response.dart';
import 'package:stock_data/features/presentation/notifier/get_stock/get_stock_state.dart';
import 'package:stock_data/features/presentation/provider/providers.dart';
import 'package:stock_data/features/presentation/widget/app_textfield.dart';

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
                    searchController: searchController, onChanged: (val) {}),
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

class StockCard extends StatelessWidget {
  final StockData data;

  const StockCard({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            height: 60,
            // width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                // color: Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.symbol.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue),
                      ),
                      Text(
                        "\$${data.close.toString()}",
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  const VerticalDivider(
                    color: Colors.blue,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NewWidget(
                          title: "Open",
                          value: data.open.toString(),
                        ),
                        NewWidget(
                          title: "High",
                          value: data.high.toString(),
                        ),
                        NewWidget(
                          title: "Low",
                          value: data.low.toString(),
                        ),
                        NewWidget(
                          title: "Adj Close",
                          value: data.adjClose.toString(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final String title;
  final String value;
  const NewWidget({Key? key, required this.value, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: 3,
          ),
          Text(value),
        ],
      ),
    );
  }
}
