import 'dart:async';

import 'package:flutter/material.dart';
import 'package:subspace_task/bootstrap.dart';
import 'package:subspace_task/core/app/app.dart';
import 'package:subspace_task/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  unawaited(bootstrap(() => const App()));
}
