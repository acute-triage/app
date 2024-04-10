import 'package:flutter/material.dart';
import 'package:flutter_starter/common/presentation/widgets/text_typography.dart';
import 'package:flutter_starter/common/util/debouncer.dart';
import 'package:flutter_starter/features/show/data/graphql/__generated__/show_card_fragment.data.gql.dart';
import 'package:flutter_starter/features/show/presentation/widgets/show_card.dart';

class HorizontalListOfShows extends StatefulWidget {
  final String title;
  final List<GShowCard> shows;
  final Function(GShowCard show)? onTap;

  const HorizontalListOfShows({
    super.key,
    required this.title,
    required this.shows,
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
        Padding(
          padding: const EdgeInsets.only(left: ShowCard.leftMargin),
          child: TextTypography.headlineMedium(widget.title),
        ),
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

                    final item = GestureDetector(
                      onTap: () => widget.onTap?.call(show),
                      child: SizedBox(
                        width: ShowCard.width,
                        child: ShowCard(
                          show: show,
                        ),
                      ),
                    );

                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 0.0,
                        left: ShowCard.leftMargin,
                        // left: index == 0 ? 12.0 : 0.0,
                      ),
                      child: item,
                    );
                  },
                ),
              ),
              // if (widget.provider != null)
              //   SliverSkeletonLoader(
              //     keyPrefix: '${widget.title}_${widget.subtitle}',
              //     provider: widget.provider!,
              //     variant: PaginatedListVariant.Horizontal,
              //     trackerKey: widget.trackerKey,
              //     count: widget.skeletonCount,
              //     trackLoadFromInit: true,
              //     skeletonBuilder: (index, _) {
              //       if (listProfiles.length == 0 && index == 0) {
              //         return Padding(
              //           padding: const EdgeInsets.only(right: 10.0),
              //           child: SizedBox(
              //             width: HorizontalProfilesListWithLargeImage.CARD_SIZE,
              //             child: const SkeletonProfileWithLargeImage(),
              //           ),
              //         );
              //       }

              //       return Padding(
              //         padding: EdgeInsets.only(right: 10.0),
              //         child: SizedBox(
              //           width: HorizontalProfilesListWithLargeImage.CARD_SIZE,
              //           child: const SkeletonProfileWithLargeImage(),
              //         ),
              //       );
              //     },
              //   ),
            ],
          ),
        ),
      ],
    );
  }
}
