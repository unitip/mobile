import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static String get apiBaseUrl => dotenv.get(
        'API_BASE_URL',
        fallback: 'http://localhost:3000/api/v1',
      );
}
