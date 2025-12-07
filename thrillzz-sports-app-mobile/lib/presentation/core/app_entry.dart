// coverage:ignore-file
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:thrillzz_sports_app/presentation/core/di/service_registry.dart';
import 'package:thrillzz_sports_app/presentation/core/di/state_registry.dart';
import 'package:thrillzz_sports_app/presentation/core/view/app.dart';

Widget buildApp() {
  return MultiProvider(
    providers: [...serviceRegistry(), ...stateRegistry()],
    child: const App(),
  );
}
