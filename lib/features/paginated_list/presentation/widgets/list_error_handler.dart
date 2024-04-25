import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/error_handler_widget.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/text_typography.dart';
import 'package:flutter_starter/features/paginated_list/presentation/widgets/list_error_load_more_button.dart';
import 'package:flutter_starter/features/paginated_list/presentation/widgets/paginated_list.dart';
import 'package:flutter_starter/i18n/strings.g.dart';

class ListErrorHandler extends ConsumerWidget {
  final PaginatedListVariant variant;
  // final AutoDisposeAsyncNotifierProviderImpl<D, PaginatedState<T>> provider;

  const ListErrorHandler({
    super.key,
    required this.variant,
    // required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final response = ref.watch(provider);
    // final hasError = response.valueOrNull?.errorLoadingMore == true ||
    //     response.hasError == true;
    // TODO: Implement this
    const hasError = true;
    const isLoading = false;
    const errorLoadingMore = false;

    if (!hasError) return const SizedBox();

    return variant == PaginatedListVariant.vertical
        ? errorLoadingMore
            ? Column(
                // min width
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextTypography.body(t.common.something_went_wrong),
                  const Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: FractionallySizedBox(
                      widthFactor: 0.4,
                      child: ListErrorLoadMoreButton(),
                    ),
                  ),
                ],
              )
            : ErrorHandlerWidget(
                onRetry: () {
                  // TODO: Handle retry logic
                  // return ref
                  //     .read(provider.notifier)
                  //     .refresh(enableLoading: false);
                },
                isLoadingRetry: isLoading,
                // description: 'Error while loading ${provider.name}',
              )
        : SizedBox(
            width: 150,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextTypography.body(
                    t.common.something_went_wrong,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ListErrorLoadMoreButton(),
                ],
              ),
            ),
          );
  }
}
