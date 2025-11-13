import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exchange_rate_repository.g.dart';

class ExchangeRateRepository {

  static String appScriptId = '1gUfrXk479J_66TELZO2XhjJy8HMKmm7vk4YilAimxzdGBliQHT7ynuEA';

  final Dio _dio;
  final String _scriptUrl = 'https://script.google.com/macros/s/$appScriptId/exec';

  ExchangeRateRepository(this._dio);

  Future<Map<String, double>> getRates() async {
    final response = await _dio.get(_scriptUrl);
    final Map rates = response.data['rates'];
    return rates.map((k, v) => MapEntry(k, v.toDouble()));
  }

  Future<double> getRate(String currency) async {
    final rates = await getRates();
    return rates['KRW$currency'] ?? 0.0;
  }
}


@riverpod
Dio dio(Ref ref) {
  return Dio();
}

@riverpod
ExchangeRateRepository exchangeRateRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ExchangeRateRepository(dio);
}

