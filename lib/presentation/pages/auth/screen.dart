import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogin = useState(true);

    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin.value ? 'Masuk' : 'Daftar'),
      ),
      body: SingleChildScrollView(
        child: Form(
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
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Nama Lengkap',
                    ),
                  ),
                  SizedBox(height: 8),
                ],

                // email
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Alamat Email',
                  ),
                ),
                SizedBox(height: 8),

                // password
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Kata Sandi',
                  ),
                ),
                SizedBox(height: 8),

                // confirm password
                if (!isLogin.value) ...[
                  TextFormField(
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
                    onPressed: () => {},
                    child: Text(isLogin.value ? 'Masuk' : 'Daftar'),
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
