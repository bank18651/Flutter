import 'package:pomelo_flutter/app_config.dart';
import 'package:pomelo_flutter/init.dart';

void main() {
  AppConfig.appFlavor = Flavor.PROD;
  init();
}
