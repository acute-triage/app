import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/button.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/text_typography.dart';
import 'package:flutter_starter/common/util/open_support_chart.dart';
import 'package:flutter_starter/i18n/strings.g.dart';

final random = Random();

class ErrorHandlerWidget extends ConsumerStatefulWidget {
  final Function()? onRetry;
  final bool isLoadingRetry;
  final Object? error;
  final StackTrace? stacktrace;
  final String? description;
  final Map<DioException?, Widget Function(DioException)?>? customErrorHandlers;
  final Widget Function(Widget)? errorWrapper;
  final Function()? onInit;

  const ErrorHandlerWidget({
    super.key,
    this.onRetry,
    this.isLoadingRetry = false,
    this.error,
    this.stacktrace,
    this.description,
    this.customErrorHandlers,
    this.errorWrapper,
    this.onInit,
  });

  @override
  ConsumerState<ErrorHandlerWidget> createState() => _ErrorHandlerWidgetState();
}

class _ErrorHandlerWidgetState extends ConsumerState<ErrorHandlerWidget> {
  bool? didRetry;

  void retry() {
    if (widget.onRetry != null) {
      widget.onRetry!();
    }
    setState(() {
      didRetry = true;
    });
  }

  bool get isHandledError {
    if (widget.customErrorHandlers != null) {
      final Widget Function(DioException)? errorWidget =
          widget.customErrorHandlers!.entries
              .firstWhere(
                (entry) => entry.key.runtimeType == widget.error.runtimeType,
                orElse: () => const MapEntry(null, null),
              )
              .value;

      if (errorWidget != null && widget.error is DioException) {
        return true;
      }
    }

    return false;
  }

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // TODO
      // ref.read(errorOccouredInSessionProvider.notifier).set(true);

      // Don't log network errors and handled errors
      if (widget.error is SocketException || isHandledError) {
        return;
      }

      widget.onInit?.call();

      if (widget.error != null) {
        // TODO: Logging
        // recordError(
        //   'Error widget shown',
        //   widget.stacktrace,
        //   exception: widget.error,
        //   reason: widget.description,
        //   context: 'ErrorWidget',
        // );
      }

      // wait 50ms to make sure the widget is not just 'flashing'
      Future.delayed(const Duration(milliseconds: 50), () {
        if (mounted) {
          // Analytics
          // AnalyticsLogger()
          //   ..logEvent(AnalyticsEvent.ERROR_WIDGET_SHOWN, {
          //     'location': widget.description,
          //   });

          // AnalyticsLogger()..increment(AnalyticsEvent.ERROR_WIDGET_SHOWN, 1);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final showSupport = (didRetry != false || widget.onRetry == null);

    ///
    /// If you want to wrap the error widget with some other widget
    ///
    Widget withErrorWrapper(Widget child) {
      return widget.errorWrapper != null ? widget.errorWrapper!(child) : child;
    }

    // Handle specific API errors
    if (widget.customErrorHandlers != null) {
      final Widget Function(DioException)? errorWidget =
          widget.customErrorHandlers!.entries
              .firstWhere(
                (entry) => entry.key.runtimeType == widget.error.runtimeType,
                orElse: () => const MapEntry(null, null),
              )
              .value;

      if (errorWidget != null && widget.error is DioException) {
        return withErrorWrapper(errorWidget(widget.error as DioException));
      }
    }

    // final randomNumberBetween1And11 = random.nextInt(11) + 1;

    return Card(
        child: Column(
      children: [
        TextTypography.headline(t.error_handler.title),
        TextTypography.body(t.error_handler.content),
        Button.primary(
          widget.onRetry != null ? t.common.retry : null,
          isLoading: widget.isLoadingRetry,
        ),
        if (showSupport)
          Button.secondary(
            t.common.contact_support,
            onTap: () {
              openSupportChat(context, location: 'Error widget');
            },
          )
      ],
    ));
  }
}
