import 'dart:async';

import 'package:coodoo_style_flutter_project/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coodoo_style_flutter_project/global_providers.dart';
import 'dart:io';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initGlobalProviders();
    // await myErrorsHandler.initialize();
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      // myErrorsHandler.onError(details);
      exit(1);
    };

    runApp(
      const ProviderScope(
        child: App(),
      ),
    );
  }, (Object error, StackTrace stack) {
    // myErrorsHandler.onError(error, stack);
    exit(1);
  });
}
