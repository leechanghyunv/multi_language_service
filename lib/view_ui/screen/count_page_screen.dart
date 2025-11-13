import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/localization/locale_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../view_model/exchange_rate_provider.dart';
import '../calendar_component/calendar.dart';

class CounterPage extends HookConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = useState(0);
    final localeAsync = ref.watch(localeProvider);

    final currency = ref.watch(currencyCodeProvider);
    final rateAsync = ref.watch(currentExchangeRateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('message'.tr()),
            Text('현재 통화: $currency'),
            SizedBox(height: 8),
            switch (rateAsync) {
              AsyncData(:final value) => Text(
                currency == 'KRW'
                    ? '${counter.value} 원'
                    : '${((counter.value / 1000) * value).toStringAsFixed(2)} $currency',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              AsyncLoading() => CircularProgressIndicator(),
              AsyncError() => Text('환율 오류'),
              _ => SizedBox(),
            },
            SizedBox(height: 20),
            Calendar(), // 🔥 캘린더 추가
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'language',
            onPressed: localeAsync.isLoading ? null : () async {
              await ref.read(localeProvider.notifier).changeLanguage();
              final locale = ref.read(localeProvider).value!;
              if (context.mounted) {
                context.setLocale(Locale(locale));
              }
            },
            tooltip: 'tooltip_language'.tr(),
            child: Icon(Icons.language),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () => counter.value++,
            tooltip: 'tooltip_increment'.tr(),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}