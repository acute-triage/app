import 'package:flutter/material.dart';
import 'package:flutter_starter/features/contact_card/domain/code.dart';

const codeRed = Code(
  color: Colors.red,
  contrastColor: Colors.white,
  name: 'Rød',
  description: 'Livstruende',
  number: 1,
  maxWaitTime: Duration(minutes: 0),
);

const codeOrange = Code(
  color: Colors.orange,
  contrastColor: Colors.black,
  name: 'Orange',
  description: 'Haster',
  number: 2,
  maxWaitTime: Duration(minutes: 15),
);

const codeYellow = Code(
  color: Colors.yellow,
  contrastColor: Colors.black,
  name: 'Gul',
  description: 'Haster mindre',
  number: 3,
  maxWaitTime: Duration(minutes: 60),
);

const codeGreen = Code(
  color: Colors.green,
  contrastColor: Colors.white,
  name: 'Grøn',
  description: 'Haster ikke',
  number: 4,
  maxWaitTime: Duration(minutes: 180),
);
