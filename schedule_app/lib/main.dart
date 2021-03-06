import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_app/app_widget.dart';
import 'package:schedule_app/bd/contact_table.dart';

import 'bd/database_helper.dart';

final getIt = GetIt.instance;
void setConfiguration() {
  getIt.registerLazySingleton(() => DataBaseHelper());
  getIt.registerLazySingleton(() => ContactTable());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setConfiguration();

  runApp(const AppWidget());
}
