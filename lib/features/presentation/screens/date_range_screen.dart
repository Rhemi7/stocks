import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_data/constants/const.dart';
import 'package:stock_data/features/presentation/widget/app_textfield.dart';
import 'package:stock_data/features/presentation/widget/stock_screen.dart';

class DateRangeScreen extends ConsumerStatefulWidget {
  const DateRangeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DateRangeScreen> createState() => _DateRangeScreenState();
}

class _DateRangeScreenState extends ConsumerState<DateRangeScreen> {
  String? from = "";
  String? to = "";

  String? groupValue;

  @override
  Widget build(BuildContext context) {
    Future<String> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010, 1),
        lastDate: DateTime.now(),
      );
      return formatDate(picked!, [yyyy, '-', mm, '-', dd]);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("From"),
              ),
              ListTile(
                onTap: () {
                  selectDate(context).then((value) {
                    from = value;
                    setState(() {});
                  });
                },
                leading: const Icon(Icons.date_range),
                title: Text(from!),
                trailing: const Text(
                  "Select Date",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("To"),
              ),
              ListTile(
                onTap: () {
                  selectDate(context).then((value) {
                    to = value;
                    setState(() {});
                  });
                },
                leading: const Icon(Icons.date_range),
                title: Text(to!),
                trailing: const Text(
                  "Select Date",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: symbols
                      .map((e) => RadioListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          title: Text(e),
                          value: e,
                          groupValue: groupValue,
                          onChanged: (val) {
                            groupValue = e;
                            setState(() {});
                          }))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StockScreen(
                                symbol: groupValue!, from: from!, to: to!)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 16),
                      child: Center(
                          child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
