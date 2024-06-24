// Class with color, description, number
import 'package:flutter/material.dart';

class Code {
  final Color color;
  final Color contrastColor;
  final String name;
  final String description;
  final int number;
  final Duration maxWaitTime;

  const Code({
    required this.color,
    required this.contrastColor,
    required this.name,
    required this.description,
    required this.number,
    required this.maxWaitTime,
  });

  factory Code.green() {
    return const Code(
      color: Colors.green,
      contrastColor: Colors.white,
      name: 'Grøn',
      description: 'Haster ikke',
      number: 4,
      maxWaitTime: Duration(minutes: 180),
    );
  }

  factory Code.yellow() {
    return const Code(
      color: Colors.yellow,
      contrastColor: Colors.black,
      name: 'Gul',
      description: 'Haster mindre',
      number: 3,
      maxWaitTime: Duration(minutes: 60),
    );
  }

  factory Code.orange() {
    return const Code(
      color: Colors.orange,
      contrastColor: Colors.black,
      name: 'Orange',
      description: 'Haster',
      number: 2,
      maxWaitTime: Duration(minutes: 15),
    );
  }

  factory Code.red() {
    return const Code(
      color: Colors.red,
      contrastColor: Colors.white,
      name: 'Rød',
      description: 'Livstruende',
      number: 1,
      maxWaitTime: Duration(minutes: 0),
    );
  }

  int compareTo(Code other) {
    return number.compareTo(other.number);
  }
}
