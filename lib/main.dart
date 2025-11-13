import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_language_service/view_ui/screen/count_page_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initializeDateFormatting();

  final prefs = await SharedPreferences.getInstance();
  final savedLocale = prefs.getString('locale') ?? 'ko';

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: [Locale('ko'), Locale('en'), Locale('zh')],
        path: 'assets/translations',
        fallbackLocale: Locale('ko'),
        startLocale: Locale(savedLocale),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(useMaterial3: false),
      home: CounterPage(),
    );
  }
}

