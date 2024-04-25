// ignore_for_file: invalid_use_of_internal_member, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/loader_widget.dart';
import 'package:flutter_starter/features/paginated_list/presentation/widgets/list_error_handler.dart';
import 'package:flutter_starter/features/paginated_list/presentation/widgets/paginated_list.dart';

class PaginatedListMoreLoader extends StatelessWidget {
  final bool infiniteLoading;
  final bool sliver;
  final PaginatedListVariant variant;

  // on tap load more
  final VoidCallback onTap;

  const PaginatedListMoreLoader({
    super.key,
    this.infiniteLoading = true,
    this.variant = PaginatedListVariant.vertical,
    this.sliver = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    sliverWrapper(Widget child) {
      return sliver
          ? SliverToBoxAdapter(
              child: child,
            )
          : child;
    }

    return sliverWrapper(
      Consumer(
        builder: (context, ref, _) {
          // final items = ref.watch(provider);
          // final hasError = items.valueOrNull?.errorLoadingMore == true ||
          //     items.hasError == true;
          // final loadingMore = items.valueOrNull?.isLoadingMore == true;
          // final hasMore = items.valueOrNull?.hasMore == true;

          // TODO:
          final items = [];
          final hasError = false;
          final loadingMore = false;
          final hasMore = false;

          return loadingMore || hasError || (hasMore && infiniteLoading)
              ? Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: hasError
                        ? ListErrorHandler(variant: variant)
                        : AnimatedLoader(
                            trackerKey: runtimeType.toString(),
                          ),
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
