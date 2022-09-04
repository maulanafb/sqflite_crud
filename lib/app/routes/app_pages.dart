import 'package:get/get.dart';

import '../modules/add_data/bindings/add_data_binding.dart';
import '../modules/add_data/views/add_data_view.dart';
import '../modules/edit_data/bindings/edit_data_binding.dart';
import '../modules/edit_data/views/edit_data_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DATA,
      page: () => AddDataView(),
      binding: AddDataBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DATA,
      page: () => EditDataView(),
      binding: EditDataBinding(),
    ),
  ];
}
