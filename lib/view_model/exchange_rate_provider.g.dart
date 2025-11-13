// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(exchangeRate)
const exchangeRateProvider = ExchangeRateFamily._();

final class ExchangeRateProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  const ExchangeRateProvider._({
    required ExchangeRateFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'exchangeRateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exchangeRateHash();

  @override
  String toString() {
    return r'exchangeRateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    final argument = this.argument as String;
    return exchangeRate(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ExchangeRateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exchangeRateHash() => r'ef30ce324daa54a24113b60225efd49a4f02330d';

final class ExchangeRateFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<double>, String> {
  const ExchangeRateFamily._()
    : super(
        retry: null,
        name: r'exchangeRateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ExchangeRateProvider call(String currency) =>
      ExchangeRateProvider._(argument: currency, from: this);

  @override
  String toString() => r'exchangeRateProvider';
}

@ProviderFor(currencyCode)
const currencyCodeProvider = CurrencyCodeProvider._();

final class CurrencyCodeProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const CurrencyCodeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currencyCodeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currencyCodeHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return currencyCode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$currencyCodeHash() => r'fe6b6f6177f3f02572b24bee8e80e2e5ae68b23d';

@ProviderFor(currentExchangeRate)
const currentExchangeRateProvider = CurrentExchangeRateProvider._();

final class CurrentExchangeRateProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  const CurrentExchangeRateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentExchangeRateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentExchangeRateHash();

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    return currentExchangeRate(ref);
  }
}

String _$currentExchangeRateHash() =>
    r'a6d674fa0b852d25a40868a87117411face6e7fe';
