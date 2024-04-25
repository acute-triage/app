import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/util/analytics_logger.dart';
import 'package:flutter_starter/common/util/load_duration_tracker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

enum AnimatedLoaderSize {
  medium,
  large,
  small,
}

class AnimatedLoader extends ConsumerStatefulWidget {
  final Color? color;
  final AnimatedLoaderSize? size;
  final String trackerKey;
  final Duration? slowDurationThresholdOverride;

  const AnimatedLoader({
    super.key,
    this.color,
    this.size,
    required this.trackerKey,
    this.slowDurationThresholdOverride,
  });

  @override
  ConsumerState<AnimatedLoader> createState() => _AnimatedLoaderState();
}

class _AnimatedLoaderState extends ConsumerState<AnimatedLoader>
    with LoadDurationTracker<AnimatedLoader> {
  @override
  void onLoadTookTooLong(Duration elapsed, _, wasMaxDuration) {
    if (widget.trackerKey.isEmpty) {
      // don't log
      return;
    }

    AnalyticsLogger().logEvent(AnalyticsEvent.slowLoad, {
      'duration': elapsed.inMilliseconds,
      'trackerKey': widget.trackerKey,
      'wasMaxDuration': wasMaxDuration,
    });
  }

  @override
  void initState() {
    super.initState();

    slowDurationThreshold = widget.slowDurationThresholdOverride ?? 1.seconds;

    trackLoadTimeFromNow(trackerKey: widget.trackerKey);
  }

  @override
  void dispose() {
    completedLoading(trackerKey: widget.trackerKey);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double getSize() {
      switch (widget.size) {
        case AnimatedLoaderSize.large:
          return 80;
        case AnimatedLoaderSize.small:
          return 22;
        case AnimatedLoaderSize.medium:
        default:
          return 44;
      }
    }

    return LoadingAnimationWidget.fourRotatingDots(
      color: context.colors.primary,
      size: getSize(),
    );
  }
}
