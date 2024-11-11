// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authenticationHash() => r'f11aeb416afb017dfc443d93a9064a816583d46d';

/// See also [Authentication].
@ProviderFor(Authentication)
final authenticationProvider = AutoDisposeAsyncNotifierProvider<Authentication,
    AuthenticatedUser?>.internal(
  Authentication.new,
  name: r'authenticationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Authentication = AutoDisposeAsyncNotifier<AuthenticatedUser?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
