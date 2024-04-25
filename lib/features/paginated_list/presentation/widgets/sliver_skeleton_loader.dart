import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/widgets/ferry_operation.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/content_padding.dart';
import 'package:flutter_starter/features/paginated_list/presentation/widgets/list_error_handler.dart';
import 'package:flutter_starter/features/paginated_list/presentation/widgets/paginated_list.dart';
import 'package:flutter_starter/features/paginated_list/util/build_skeleton_list.dart';

class SliverSkeletonLoader<TData, TVars> extends ConsumerWidget {
  final String keyPrefix;
  final Widget Function(int index, bool isLast) skeletonBuilder;
  final int? count;
  final PaginatedListVariant variant;
  final bool infiniteLoading;
  final bool trackLoadFromInit;
  final String trackerKey;
  final OperationRequest<TData, TVars> request;
  final VoidCallback? loadMore;

  const SliverSkeletonLoader({
    super.key,
    required this.keyPrefix,
    required this.skeletonBuilder,
    required this.request,
    this.count,
    this.variant = PaginatedListVariant.vertical,
    this.infiniteLoading = true,
    required this.trackerKey,
    this.trackLoadFromInit = true,
    required this.loadMore,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skeletonsToRender = count ?? 4;
    final bool debuggingSkeletons = ref.watch(debuggingSkeletonsProvider);

    return FerryClientProvider(
      child: (ferry) => Operation(
          client: ferry,
          operationRequest: request,
          builder: (context, response, error) {
            if (response?.loading == true && !debuggingSkeletons) {
              return const SliverToBoxAdapter(child: SizedBox());
            }

            if (error != null) {
              return SliverToBoxAdapter(
                key: Key('${keyPrefix}_error'),
                child: ContentPadding(
                  vertical: true,
                  child: ListErrorHandler(
                    // provider: provider,
                    variant: variant,
                  ),
                ),
              );
            }

            return buildSkeletonList(
              (index) => skeletonBuilder(index, index == skeletonsToRender - 1),
              ref,
              count: count ?? 3,
              infiniteLoading: infiniteLoading,
              sliver: true,
              shouldRender: true,
              keyPrefix: keyPrefix,
              trackerKey: trackerKey,
              // provider: provider,
              onSkeletonVisible: () {
                // TODO: Fix
                loadMore?.call();

                return Future.value();
              },
            );
          }),
    );
  }
}
