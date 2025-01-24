import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../feature/card_scanner/card_scanner_binding.dart';
import '../../feature/card_scanner/card_scanner_view.dart';

List<GetPage> routes = [
  GetPage(
    name: CardScannerPage.route,
    page: () => CardScannerPage(),
    binding: CardScannerBinding(),
  ),
];