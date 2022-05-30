import 'package:logger/logger.dart';

const baseUrl = "https://jsonplaceholder.typicode.com/";
final logger = new Logger(
  printer: PrettyPrinter(
      methodCount: 1,
      lineLength: 100,
      errorMethodCount: 3,
      colors: true,
      printEmojis: true),
);
