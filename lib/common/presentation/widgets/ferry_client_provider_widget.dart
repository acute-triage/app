import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/widgets/ferry_operation.dart';

class FerryOperation<TData, TVars> extends ConsumerWidget {
  final OperationRequest<TData, TVars> request;
  final OperationResponseBuilder<TData, TVars>? builder;
  final Widget Function(TData response, Client client)? data;

  const FerryOperation({
    super.key,
    this.builder,
    required this.request,
    this.data,
  }) : assert(builder != null || data != null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FerryClientProvider(
      child: (ferry) => Operation(
        client: ferry,
        operationRequest: request,
        builder: (context, response, error) {
          if (response == null || response.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (error != null) {
            return Text(error.toString());
          }

          if (response.hasErrors) {
            if (response.linkException != null) {
              return Text(response.linkException.toString());
            }

            return Text(response.graphqlErrors.toString());
          }

          if (data != null && response.data != null) {
            return data!(response.data as TData, ferry);
          }

          if (builder == null) {
            throw Exception('builder or data must be provided');
          }

          return builder!(context, response, error);
        },
      ),
    );
  }
}
