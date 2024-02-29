import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_starter/env.dart';

final random = Random();

final networkRequestDelayInterceptor = QueuedInterceptorsWrapper(
  onRequest: (options, handler) async {
    const delay = Env.networkRequestDelay;

    if (delay != null && delay.isNotEmpty) {
      final delays = delay.split(',');
      final min = int.parse(delays[0]);
      final max = delay.contains(',') ? int.parse(delays[1]) : min;
      final delayBetweenMinMax = min + random.nextInt(max - min + 1);

      await Future.delayed(Duration(milliseconds: delayBetweenMinMax));
    }

    return handler.next(options);
  },
);
