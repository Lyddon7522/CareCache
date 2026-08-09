import 'package:flutter/material.dart';

import 'app/app_dependencies.dart';
import 'app/care_cache_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dependencies = await AppDependencies.create();
  runApp(CareCacheApp(dependencies: dependencies));
}
