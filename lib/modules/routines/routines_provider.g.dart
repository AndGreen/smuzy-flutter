// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routines_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$RoutinesHash() => r'bca73c060ff8e0ebdda29eb3cb1d8fc7b9f09f30';

/// See also [Routines].
final routinesProvider = AutoDisposeNotifierProvider<Routines, RoutinesState>(
  Routines.new,
  name: r'routinesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$RoutinesHash,
);
typedef RoutinesRef = AutoDisposeNotifierProviderRef<RoutinesState>;

abstract class _$Routines extends AutoDisposeNotifier<RoutinesState> {
  @override
  RoutinesState build();
}
