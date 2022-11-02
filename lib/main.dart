import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stock_data/features/presentation/screens/dashboard.dart';
import 'package:stock_data/features/presentation/screens/date_range_screen.dart';
import 'package:stock_data/features/presentation/screens/home_screen.dart';
import 'service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize dependency injection
  await di.setUpLocator();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ConnectivityResult? subscription;
  var isDeviceConnected = false;

  @override
  void initState() {
    super.initState();
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected) {
        Fluttertoast.showToast(
            msg: "Network Unavailable",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.black);
      }
    });
  }

  @override
  void dispose() {
    // subscription.cancel();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Api',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // backgroundColor: const Color(0xff212121),
          appBarTheme: const AppBarTheme(
              elevation: 0.0, backgroundColor: Color(0xff212121))),
      home: const Dashboard(),
    );
  }
}
