import 'package:flutter_multi_language_service/core/localization/locale_provider.dart';
import 'package:flutter_multi_language_service/repository/exchange_rate_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exchange_rate_provider.g.dart';

@riverpod
Future<double> exchangeRate(Ref ref, String currency) async {
  final repository = ref.watch(exchangeRateRepositoryProvider);
  return repository.getRate(currency);
}

@riverpod
String currencyCode(Ref ref) {
  final localeAsync = ref.watch(localeProvider);

  return switch (localeAsync) {
    AsyncData(:final value) => switch (value) {
      'ko' => 'KRW',
      'en' => 'USD',
      'zh' => 'CNY',
      _ => 'KRW',
    },
    _ => 'KRW',
  };
}

@riverpod
Future<double> currentExchangeRate(Ref ref) async {
  final currency = ref.watch(currencyCodeProvider);

  if (currency == 'KRW') return 1.0;

  return ref.watch(exchangeRateProvider(currency)).when(
    data: (rate) => rate,
    loading: () => 0.0,
    error: (_, __) => 0.0,
  );
}