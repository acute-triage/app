// ignore_for_file: prefer_const_declarations

import 'dart:math';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/features/paginated_list/presentation/widgets/list_header.dart';
import 'package:flutter_starter/features/paginated_list/presentation/widgets/more_loader.dart';
import 'package:flutter_starter/features/paginated_list/presentation/widgets/sliver_skeleton_loader.dart';
import 'package:sliver_tools/sliver_tools.dart';

enum PaginatedListVariant { vertical, horizontal }

class PaginatedList<TData, TVars, T> extends ConsumerWidget {
  final int? maxItems;
  final int? skeletonItems;
  final String? header;
  final bool? stickyHeader;
  final Widget Function(T item, int index, bool isLast) builder;
  final Widget Function(int index, bool isLast)? skeletonBuilder;
  final void Function(T item)? onTap;
  final void Function()? onTapLoadMore;
  final Widget? emptyListWidget;
  final String trackerKey;
  final OperationRequest<TData, TVars> request;

  /// Filter items before rendering (e.g. filter out items that are not friends)
  final bool Function(T item)? filter;

  const PaginatedList({
    super.key,
    this.maxItems,
    this.skeletonItems,
    this.header,
    this.stickyHeader = false,
    required this.builder,
    required this.request,
    this.onTap,
    this.onTapLoadMore,
    this.skeletonBuilder,
    this.emptyListWidget,
    required this.trackerKey,
    this.filter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debuggingSkeletons = false;

    // final shouldNotRender = ref.watch(
    //   provider.select(
    //     (state) =>
    //         !state.hasError &&
    //         (state.valueOrNull?.items ?? []).isEmpty &&
    //         emptyListWidget == null &&
    //         (!state.isLoading ||
    //             (state.hasValue && state.valueOrNull?.items.isEmpty == true)) &&
    //         state.valueOrNull?.isLoadingMore == false,
    //   ),
    // );

    final shouldNotRender = true;

    if (shouldNotRender) {
      return const SliverToBoxAdapter(child: SizedBox());
    }

    final items = [];

    return MultiSliver(
      key: ValueKey('${toString()}_paginated_list'),
      children: [
        if (header != null)
          SliverToBoxAdapter(
            key: ValueKey('${toString()}_header'),
            child: ListHeader(
              header!,
            ),
          ),
        MultiSliver(
          key: ValueKey('${toString()}_outer_wrapper'),
          children: [
            if (!debuggingSkeletons)
              MultiSliver(
                key: ValueKey('${toString()}_items'),
                children: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: maxItems == null
                          ? items.length
                          : min(items.length, maxItems!),
                      (BuildContext context, int index) {
                        final item = items[index];
                        final isLast = index == items.length - 1;

                        return RepaintBoundary(
                          child: GestureDetector(
                            onTap: () => onTap?.call(item),
                            child: builder(item, index, isLast),
                          ),
                        );
                      },
                    ),
                  ),
                  if (emptyListWidget != null)
                    Consumer(
                      key: ValueKey('${toString()}_empty_wrapper'),
                      builder: (_, innerInnerRef, __) {
                        final shouldRender = false;
                        // final shouldRender = innerInnerRef.watch(
                        //   provider.select(
                        //     (value) =>
                        //         !value.isLoading &&
                        //         items.isEmpty == true &&
                        //         value.hasValue,
                        //   ),
                        // );

                        if (shouldRender) {
                          return emptyListWidget!;
                        }

                        return const SliverToBoxAdapter(child: SizedBox());
                      },
                    ),
                ],
              ),

            if (skeletonBuilder != null)
              SliverSkeletonLoader(
                request: request,
                trackerKey: trackerKey,
                key: ValueKey('${toString()}_skeleton_loader'),
                keyPrefix: '${toString()}_$key',
                skeletonBuilder: skeletonBuilder!,
                count: skeletonItems ?? maxItems,
                infiniteLoading: maxItems == null,
                loadMore: () {},
              ),

            // Show more button for pagination
            if (onTapLoadMore != null && maxItems != null)
              Consumer(
                key: ValueKey('${toString()}_load_more'),
                builder: (_, innerRef, __) {
                  if (items.length >= maxItems!) {
                    return MultiSliver(
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
                        PaginatedListMoreLoader(
                          onTap: onTapLoadMore!,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox());
                },
              ),
          ],
        ),
      ],
    );
  }
}
