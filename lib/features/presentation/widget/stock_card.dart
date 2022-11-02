import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:stock_data/features/presentation/widget/text_widget.dart';

import '../../data/model/stock_response.dart';
import '../screens/home_screen.dart';

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
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
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
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              TextWidget(
                                title: "Open",
                                value: data.open.toString(),
                              ),
                              Spacer(),
                              TextWidget(
                                title: "High",
                                value: data.high.toString(),
                              ),
                              Spacer(),
                              TextWidget(
                                title: "Low",
                                value: data.low.toString(),
                              ),
                              Spacer(),
                              TextWidget(
                                title: "Exchange",
                                value: data.exchange.toString(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text("Date: ${formatDate(DateTime.parse(data.date!), [yyyy, '-', mm, '-', dd])}")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
