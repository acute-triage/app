import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/application/ferry_provider.dart';

class FerryClientProvider extends ConsumerWidget {
  final Widget Function(Client client) child;

  const FerryClientProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ferry = ref.watch(ferryProvider);

    return ferry.when(
      data: child,
      error: (error, stackTrace) {
        return Text('Error: $error');
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
