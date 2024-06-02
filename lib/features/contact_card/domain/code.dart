// Class with color, description, number
import 'dart:ui';

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

  int compareTo(Code other) {
    return number.compareTo(other.number);
  }
}
