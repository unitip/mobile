import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unitip/core/failure/failure.dart';
import 'package:unitip/core/providers/provider.dart';

part 'screen.g.dart';

@riverpod
class _Auth extends _$Auth {
  @override
  FutureOr<void> build() {}

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = AsyncLoading();

    final response = await ref
        .read(authenticationRepositoryProvider)
        .login(email: email, password: password);

    response.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) => state = AsyncData(null),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {}
}

@RoutePage()
class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final isLogin = useState(true);

    final controllerName = useTextEditingController();
    final controllerEmail = useTextEditingController(
      text: 'rizaldwianggoro@unitip.com',
    );
    final controllerPassword = useTextEditingController(text: 'password');
    final controllerConfirmPassword = useTextEditingController();

    final authentication = ref.watch(_authProvider);

    ref.listen(
      _authProvider,
      (previous, next) {
        if (next.hasError &&
            previous?.error != next.error &&
            next.error is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text((next.error as Failure).message),
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin.value ? 'Masuk' : 'Daftar'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey.value,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isLogin.value
                      ? 'Masukkan beberapa informasi berikut untuk masuk ke akun Unitip'
                      : 'Masukkan beberapa informasi berikut untuk membuat '
                          'akun dan bergabung dengan Unitip',
                ),
                SizedBox(height: 16),

                // name
                if (!isLogin.value) ...[
                  TextFormField(
                    controller: controllerName,
                    validator: (value) {
                      if (value == null) {
                        return 'Nama lengkap tidak boleh kosong';
                      }

                      if (value.isEmpty) {
                        return 'Nama lengkap tidak boleh kosong';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Nama Lengkap',
                    ),
                  ),
                  SizedBox(height: 8),
                ],

                // email
                TextFormField(
                  controller: controllerEmail,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Alamat Email',
                  ),
                ),
                SizedBox(height: 8),

                // password
                TextFormField(
                  controller: controllerPassword,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Kata Sandi',
                  ),
                ),
                SizedBox(height: 8),

                // confirm password
                if (!isLogin.value) ...[
                  TextFormField(
                    controller: controllerConfirmPassword,
                    validator: (value) {
                      if (value == null) {
                        return 'Konfirmasi kata sandi tidak boleh kosong';
                      }

                      if (value.isEmpty) {
                        return 'Konfirmasi kata sandi tidak boleh kosong';
                      }

                      if (value != controllerPassword.text) {
                        return 'Konfirmasi kata sandi tidak cocok';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Konfirmasi Kata Sandi',
                    ),
                  ),
                  SizedBox(height: 8),
                ],

                // button submit
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  alignment: Alignment.centerRight,
                  child: FilledButton(
                    onPressed: authentication.isLoading
                        ? null
                        : () {
                            if (formKey.value.currentState!.validate()) {
                              final name = controllerName.text;
                              final email = controllerEmail.text;
                              final password = controllerPassword.text;

                              if (isLogin.value) {
                                ref.read(_authProvider.notifier).login(
                                      email: email,
                                      password: password,
                                    );
                              } else {
                                ref.read(_authProvider.notifier).register(
                                      name: name,
                                      email: email,
                                      password: password,
                                    );
                              }
                            }
                          },
                    child: authentication.isLoading
                        ? SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.onPrimary,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(isLogin.value ? 'Masuk' : 'Daftar'),
                  ),
                ),

                // button switch auth
                Center(
                  child: TextButton(
                    onPressed: () => isLogin.value = !isLogin.value,
                    child: Text(
                      isLogin.value
                          ? 'Belum punya akun Unitip? Daftar sekarang juga'
                          : 'Sudah punya akun Unitip? Masuk sekarang juga',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
