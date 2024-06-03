import 'package:flutter/material.dart';

///
/// Condtionally wraps a [child] with a [wrapper] if [condition] is true
///

class ConditionalWrapper extends StatelessWidget {
  /// The child to wrap with [wrapper] if [condition] is true
  final Widget child;

  /// The condition to check whether to wrap [child] with [wrapper]
  final bool condition;

  /// The wrapper to wrap [child] with if [condition] is true
  final Widget Function(Widget child) wrapper;

  const ConditionalWrapper({
    super.key,
    required this.child,
    required this.condition,
    required this.wrapper,
  });

  @override
  Widget build(BuildContext context) {
    return condition ? wrapper(child) : child;
  }
}
