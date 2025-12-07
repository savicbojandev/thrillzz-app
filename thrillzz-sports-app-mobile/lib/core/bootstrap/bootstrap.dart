// coverage:ignore-file
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thrillzz_sports_app/core/di/di.dart';
import 'package:thrillzz_sports_app/core/logging/logging.dart';

const designSize = Size(412, 915);

class AppBlocObserver extends BlocObserver {
  final LogService _logger = getIt<LogService>();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    _logger.debug('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _logger.error('onError(${bloc.runtimeType})', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  FlutterError.onError = (details) {
    getIt<LogService>().error(
      'FlutterError: ${details.exceptionAsString()}',
      details.exception,
      details.stack,
    );
  };
  Bloc.observer = AppBlocObserver();

  final app = await builder();

  runApp(
    ScreenUtilInit(
      designSize: designSize,
      builder: (context, child) => app,
    ),
  );
}
