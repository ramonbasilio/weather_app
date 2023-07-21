import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weaher_app/provider/app_provider.dart';
import 'package:weaher_app/view/page_search_city.dart';
import 'package:weaher_app/view/page_weather_forecast.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
    create: (_) => AppProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PageWeatherForecast(),
        '/pageSearchCity': (context) => const PageSearchCity(),
      },
    );
  }
}
