import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:warung_nikmat/core.dart';
import 'package:warung_nikmat/firebase_options.dart';

Future initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && !Platform.isWindows) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  var path = await getTemporaryDirectory();
  Hive.init(path.path);
  mainStorage = await Hive.openBox('mainStorage');
}
