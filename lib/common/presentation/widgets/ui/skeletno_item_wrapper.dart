import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/util/analytics_logger.dart';
import 'package:flutter_starter/common/util/debouncer.dart';
import 'package:flutter_starter/common/util/load_duration_tracker.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkeletonItemWrapper extends ConsumerStatefulWidget {
  /// The skeleton widget to display. Preferably a const widget.
  final Widget skeleton;

  /// Called when the skeleton is visible. Should return a promise that resolves when the skeleton is done loading.
  final Future<void> Function() onVisible;

  /// A tracker key to identify this skeleton item, used by [AnalyticsEvent.slowLoad] event.
  final String trackerKey;

  const SkeletonItemWrapper({
    super.key,
    required this.skeleton,
    required this.onVisible,
    required this.trackerKey,
  });

  @override
  ConsumerState<SkeletonItemWrapper> createState() =>
      _SkeletonItemWrapperState();
}

class _SkeletonItemWrapperState extends ConsumerState<SkeletonItemWrapper>
    with LoadDurationTracker {
  UniqueKey? _rerenderKey;
  final Debouncer _debouncer =
      Debouncer(milliseconds: 500, runInitially: false);

  @override
  void onLoadTookTooLong(
      Duration elapsed, String trackerKey, bool wasMaxDuration) {
    // The use of RateLimit is to prevent spamming of the same event.
    // which technically shouldn't happen, but it does for a single skeleton item
    // (unlock_doubble_match_list_) - no clue why since they use the same implementation as the other
    // on Matches screen 🤔
    AnalyticsLogger().logEventWithRateLimit(
      AnalyticsEvent.slowLoad,
      key: trackerKey,
      duration: 1.seconds,
      properties: {
        'duration': elapsed.inMilliseconds,
        'trackerKey': trackerKey,
        'wasMaxDuration': wasMaxDuration,
      },
    );
  }

  @override
  void dispose() {
    completedLoading(trackerKey: widget.trackerKey);

    _debouncer.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // post frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      // TODO: Track loading if loading
      // if (widget.provider != null &&
      //     ref.read(widget.provider!.select((value) => value.isLoading))) {
      //   trackLoadTimeFromNow(trackerKey: widget.trackerKey);
      // }

      _checkIfVisible();
    });

    super.initState();
  }

  _checkIfVisible() {
    // post frame
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // wait 500ms

      await Future.delayed(500.milliseconds);

      if (!mounted) {
        return;
      }

      _debouncer.run(() {
        // TODO?
        // if (widget.provider != null) {
        //   final stillLoading =
        //       ref.read(widget.provider!.select((state) => state.isLoading));

        //   if (stillLoading) {
        //     return _checkIfVisible();
        //   }
        // }

        setState(() {
          _rerenderKey = UniqueKey();
        });

        VisibilityDetectorController.instance.notifyNow();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.provider != null) {
    //   ref.listen(widget.provider!, (prev, next) {
    //     if (prev?.isLoading == true && next.isLoading == false) {
    //       // completed loading
    //       completedLoading(trackerKey: widget.trackerKey);

    //       _checkIfVisible();
    //     }
    //   });
    // }

    return VisibilityDetector(
      key: _rerenderKey ?? widget.key!,
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0) {
          trackLoadTimeFromNow(trackerKey: widget.trackerKey);

          widget.onVisible().then((_) {
            return completedLoading(trackerKey: widget.trackerKey);
          });
        }
      },
      child: widget.skeleton,
    );
  }
}
