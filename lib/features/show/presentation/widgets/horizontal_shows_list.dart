import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/util/debouncer.dart';
import 'package:flutter_starter/features/paginated_list/presentation/widgets/list_header.dart';
import 'package:flutter_starter/features/paginated_list/presentation/widgets/paginated_list.dart';
import 'package:flutter_starter/features/paginated_list/presentation/widgets/sliver_skeleton_loader.dart';
import 'package:flutter_starter/features/show/data/graphql/__generated__/show_card_fragment.data.gql.dart';
import 'package:flutter_starter/features/show/presentation/widgets/show_card.dart';

class HorizontalListOfShows<TData, TVars> extends StatefulWidget {
  final String title;
  final List<GShowCard> shows;
  final Function(GShowCard show)? onTap;
  final OperationRequest<TData, TVars> request;
  final VoidCallback loadMore;

  const HorizontalListOfShows({
    super.key,
    required this.title,
    required this.shows,
    required this.request,
    required this.loadMore,
    this.onTap,
  });

  @override
  State<HorizontalListOfShows> createState() => _HorizontalListOfShowsState();
}

class _HorizontalListOfShowsState extends State<HorizontalListOfShows> {
  late ScrollController _scrollController;

  final Debouncer _debouncer = Debouncer(milliseconds: 250);

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController(
      initialScrollOffset: 0,
    );

    _scrollController.addListener(() {
      // context.getSwipeablePageRoute()?.canSwipe =
      //     _scrollController.position.pixels <= 0;
      // _debouncer.run(() {
      //   context.getSwipeablePageRoute()?.canSwipe = true;
      // });
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();

    _debouncer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListHeader(widget.title),
        const SizedBox(height: 8),
        SizedBox(
          height: 218,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.all(
          //     context.themeVariables.defaultRadius!.asRadius,
          //   ),
          // ),
          child: CustomScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            controller: _scrollController,
            slivers: [
              // const SliverToBoxAdapter(
              //   child: SizedBox(width: 12),
              // ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: widget.shows.length,
                  (BuildContext context, int index) {
                    final show = widget.shows[index];

                    return GestureDetector(
                      onTap: () => widget.onTap?.call(show),
                      child: _ListItemPadding(
                        child: ShowCard(
                          show: show,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverSkeletonLoader(
                // TODO: make key prefix more unique
                keyPrefix: widget.title,
                trackerKey: '${toString()}_${widget.title}',
                request: widget.request,
                // provider: widget.provider!,
                variant: PaginatedListVariant.horizontal,
                // trackerKey: widget.trackerKey,
                // count: widget.skeletonCount,
                trackLoadFromInit: true,
                loadMore: widget.loadMore,
                skeletonBuilder: (index, _) {
                  return const _ListItemPadding(
                    child: ShowCard.skeleton(),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ListItemPadding extends StatelessWidget {
  const _ListItemPadding({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 0.0,
        left: ShowCard.leftMargin,
      ),
      child: child,
    );
  }
}
