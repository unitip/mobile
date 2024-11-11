import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unitip/shared/data/repositories/authentication.dart';

part 'dependency_injection.g.dart';

@riverpod
String helloWorld(Ref ref) {
  return 'hello world from provider';
}

// repositories
@riverpod
AuthenticationRepositoryImpl authenticationRepository(Ref ref) =>
    AuthenticationRepositoryImpl();
