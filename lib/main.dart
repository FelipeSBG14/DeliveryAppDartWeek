import 'package:delivery_app/app/delivery_app.dart';
import 'package:flutter/cupertino.dart';

import 'app/core/env/env.dart';

void main() async {
  await Env.i.load();
  runApp(const DeliveryApp());
}
