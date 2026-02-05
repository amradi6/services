import 'package:flutter/material.dart';
import 'package:services/app/app.dart';

import 'app/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp( MyApp());
}

