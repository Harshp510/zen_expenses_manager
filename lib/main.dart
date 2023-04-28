import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zen_expenses_manager/Splashpage.dart';
import 'package:provider/provider.dart';
import 'package:zen_expenses_manager/TAF_Expenses.dart';
import 'package:zen_expenses_manager/prefrence/PreferenceUtils.dart';
import 'package:zen_expenses_manager/provider/DrawerItemRow.dart';

import 'NavigationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferenceUtils.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,

  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DrawerItemRow()),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        themeMode: ThemeMode.light,
       // theme: ThemeData(brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue, 
        ),
            initialRoute: '/',
            routes: {
              '/': (context) => const TAF_Expenses(),
            }
      ),
    );
  }
}


