import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unitip/core/application.dart';

Future<void> main() async {
  // load env file
  await dotenv.load(fileName: '.env');

  runApp(
    ProviderScope(
      child: UnitipApplication(),
    ),
  );
}
