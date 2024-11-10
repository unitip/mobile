import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unitip/data/repositories/authentication.dart';

part 'provider.g.dart';

@riverpod
String helloWorld(Ref ref) {
  return 'hello world from provider';
}

// repositories
@riverpod
AuthenticationRepositoryImpl authenticationRepository(Ref ref) =>
    AuthenticationRepositoryImpl();
