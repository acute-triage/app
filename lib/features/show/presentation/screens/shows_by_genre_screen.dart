import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/application/logger.dart';
import 'package:flutter_starter/common/presentation/widgets/ferry_client_provider_widget.dart';
import 'package:flutter_starter/features/show/data/graphql/__generated__/shows_by_genre.data.gql.dart';
import 'package:flutter_starter/features/show/data/graphql/__generated__/shows_by_genre.req.gql.dart';
import 'package:flutter_starter/features/show/data/graphql/__generated__/shows_by_genre.var.gql.dart';
import 'package:flutter_starter/features/show/presentation/widgets/horizontal_shows_list.dart';

@RoutePage()
class ShowsByGenreScreen extends StatefulWidget {
  const ShowsByGenreScreen({super.key});

  @override
  State<ShowsByGenreScreen> createState() => _ShowsByGenreScreenState();
}

class _ShowsByGenreScreenState extends State<ShowsByGenreScreen> {
  @override
  Widget build(BuildContext context) {
    final req = GShowsByGenreReq(
      (b) => b
        ..requestId = 'shows_by_genre'
        ..vars.page = 1
        ..vars.serviceNames = ListBuilder<String>(['netflix'])
        ..vars.countryCodes = ListBuilder<String>(['dk']),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shows by genre'),
        // search icon
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // context.router.push(const SearchRoute());
            },
          ),
        ],
      ),
      body: FerryOperation(
        request: req,
        data: (response, client) => ListView.builder(
          itemCount: response.genres?.length ?? 0,
          itemBuilder: (context, index) {
            final genre = response.genres![index]!;
            final isLast = index == response.genres!.length - 1;

            final item = Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child:
                  HorizontalListOfShows<GShowsByGenreData, GShowsByGenreVars>(
                title: genre.name,
                shows: genre.shows?.toList() ?? [],
                request: req,
                loadMore: () {
                  Logger.info('Load more');

                  req.rebuild((p0) => []);

                  // Implement load more
                  // final newRequest = req.rebuild(
                  //   (b) => b
                  //     ..vars.page = req.vars.page + 1
                  //     ..updateResult = (previous, result) {
                  //       if (previous == null) {
                  //         return result;
                  //       }

                  //       return previous.rebuild(
                  //         (b) => b..genres.addAll(result!.genres!.toList()),
                  //       );
                  //     },
                  // );

                  // client.requestController.add(newRequest);
                },
              ),
            );

            return isLast
                ? Column(
                    children: [
                      item,
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          final newRequest = req.rebuild(
                            (b) => b
                              ..vars.page = req.vars.page + 1
                              ..updateResult = (previous, result) {
                                if (previous == null) {
                                  return result;
                                }

                                return previous.rebuild(
                                  (b) => b
                                    ..genres.addAll(result!.genres!.toList()),
                                );
                              },
                          );

                          client.requestController.add(newRequest);
                        },
                        child: const Text('Shows by genre'),
                      ),
                    ],
                  )
                : item;
          },
        ),
      ),
    );
  }
}
