import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/main_root_widget.dart';

void main() async {
  runApp(const ProviderScope(child: MainRootWidget()));
}
