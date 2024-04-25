import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/button.dart';
import 'package:flutter_starter/i18n/strings.g.dart';

class ListErrorLoadMoreButton extends ConsumerWidget {
  const ListErrorLoadMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Button.outlined(
      t.common.retry,
      onTap: () async {
        // final state = ref.read(provider.notifier);

        // if (state.safeValue.errorLoadingMore) {
        //   await state.loadMore(manual: true);
        // } else {
        //   await state.refresh(enableLoading: false);
        // }
      },
      // isLoading: ref.watch(provider.select((value) =>
      //     value.isLoading || value.valueOrNull?.isLoadingMore == true)),
      shape: ButtonShape.Circled,
      size: ButtonSize.Small,
    );
  }
}
