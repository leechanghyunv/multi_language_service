import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_provider.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  static const _key = 'locale';

  @override
  Future<String> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key) ?? 'ko';
  }

  Future<void> changeLanguage() async {
    final current = await future;
    final next = switch (current) {
      'ko' => 'en',
      'en' => 'zh',
      _ => 'ko',
    };

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, next);
    state = AsyncData(next);
  }

}

@riverpod
String calendarLocale(ref) {
  final localeAsync = ref.watch(localeProvider);

  return switch (localeAsync) {
    AsyncData(:final value) => switch (value) {
      'ko' => 'ko_KR',
      'en' => 'en_US',
      'zh' => 'zh_CN',
      _ => 'ko_KR',
    },
    _ => 'ko_KR',
  };
}