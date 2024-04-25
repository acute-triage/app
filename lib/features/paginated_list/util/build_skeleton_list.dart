// ignore_for_file: invalid_use_of_internal_member

import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/skeletno_item_wrapper.dart';

///
/// Double-Tap to toggle skeletons, while not in production mode
///
///
final debuggingSkeletonsProvider = StateProvider<bool>((ref) {
  return false;
});

/// Builds a list of skeleton widgets for a paginated list.
/// NOTE: Remember to pass in 'const' in front of the widget for the builder function
Widget buildProviderSkeletonList(
  Widget Function(int index) builder,
  WidgetRef ref, {
  int count = 8,
  bool infiniteLoading = true,
  bool sliver = false,
  required String keyPrefix,
  required String trackerKey,
}) {
  final bool debuggingSkeletons = ref.watch(debuggingSkeletonsProvider);

  // final bool shouldRender =
  //     shouldRenderSkeletons(ref, provider, infiniteLoading: infiniteLoading);
  // TODO: Fix build
  const bool shouldRender = true;

  Widget sliverWrapper(Widget child) {
    return sliver
        ? SliverToBoxAdapter(
            child: child,
          )
        : child;
  }

  if (!shouldRender && !debuggingSkeletons) {
    return sliverWrapper(const SizedBox());
  }

  return buildSkeletonList(
    builder,
    ref,
    count: count,
    infiniteLoading: infiniteLoading,
    sliver: sliver,
    shouldRender: shouldRender,
    keyPrefix: keyPrefix,
    trackerKey: trackerKey,
    // provider: provider,
    onSkeletonVisible: () {
      // TODO: Implement load more
      // if (ref.read(provider.notifier).canLoadMore()) {
      //   return ref.read(provider.notifier).loadMore();
      // }

      return Future.value();
    },
  );
}

/// Builds a list of skeleton widgets
/// NOTE: Remember to pass in 'const' in front of the widget for the builder function
Widget buildSkeletonList(
  Widget Function(int index) builder,
  WidgetRef ref, {
  int count = 8,
  bool infiniteLoading = true,
  bool sliver = false,
  bool shouldRender = true,
  required String keyPrefix,
  required String trackerKey,
  required Future<void> Function() onSkeletonVisible,
}) {
  final bool debuggingSkeletons = ref.watch(debuggingSkeletonsProvider);

  Widget sliverWrapper(Widget child) {
    return sliver
        ? SliverToBoxAdapter(
            child: child,
          )
        : child;
  }

  if (!shouldRender && !debuggingSkeletons) {
    return sliverWrapper(const SizedBox());
  }

  // final skeletonItem = (index) => onSkeletonVisible != null
  //     ? VisibilityDetector(
  //         key: Key('${keyPrefix}_skeleton_$index'),
  //         onVisibilityChanged: (VisibilityInfo info) {
  //           if (info.visibleFraction > 0) {
  //             onSkeletonVisible.call();
  //           }
  //         },
  //         child: builder(index),
  //       )
  //     : builder(index);

  skeletonItem(index) => SkeletonItemWrapper(
        skeleton: builder(index),
        onVisible: onSkeletonVisible,
        key: Key('${trackerKey}_skeleton_$index'),
        trackerKey: trackerKey,
      );

  return sliver
      ? SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: count,
            (BuildContext context, int index) => skeletonItem(index),
          ),
        )
      : ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) => skeletonItem(index),
        );
}

bool shouldRenderSkeletons<TData, TVars>(
  WidgetRef ref,
  OperationRequest<TData, TVars> request, {
  bool infiniteLoading = true,
}) =>
    false;

    // ref.watch(
    //   provider.select(
    //     (state) {
    //       final hasError = state.valueOrNull?.errorLoadingMore == true ||
    //           state.hasError == true;
    //       final loadingWithNoItems = state.isLoading &&
    //           (!state.hasValue || state.valueOrNull?.items.isEmpty == true);
    //       final couldHaveMore = state.valueOrNull?.items.isNotEmpty == true
    //           ? state.valueOrNull!.items.length >=
    //               ref.read(provider.notifier).take
    //           : true;
    //       final hasMoreWithInfinityLoading =
    //           state.valueOrNull?.hasMore == true &&
    //               infiniteLoading &&
    //               couldHaveMore;

    //       // When debugging strange apperances, consider checking state.isRefreshing
    //       final conclusion = !hasError &&
    //           (loadingWithNoItems || //
    //               state.valueOrNull?.isLoadingMore == true || //
    //               hasMoreWithInfinityLoading); //

    //       return conclusion;
    //     },
    //   ),
    // );
