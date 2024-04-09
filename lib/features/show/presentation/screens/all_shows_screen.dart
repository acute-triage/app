import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/application/router.gr.dart';
import 'package:flutter_starter/common/presentation/widgets/ferry_client_provider_widget.dart';
import 'package:flutter_starter/features/show/data/graphql/__generated__/all_shows.req.gql.dart';
import 'package:flutter_starter/features/show/presentation/widgets/show_card.dart';

@RoutePage()
class AllShowsScreen extends StatefulWidget {
  const AllShowsScreen({super.key});

  @override
  State<AllShowsScreen> createState() => _AllShowsScreenState();
}

class _AllShowsScreenState extends State<AllShowsScreen> {
  @override
  Widget build(BuildContext context) {
    final req = GAllShowsReq(
      (b) => b
        ..vars.page = 1
        ..vars.serviceNames = ListBuilder<String>(['netflix'])
        ..vars.countryCodes = ListBuilder<String>(['dk']),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Shows'),
      ),
      body: FerryOperation(
        request: req,
        data: (response) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            childAspectRatio: 0.65,
          ),
          itemCount: response.shows?.length ?? 0,
          itemBuilder: (context, index) {
            final show = response.shows![index]!;

            return ShowCard(
              show: show,
            );
          },
        ),
      ),
    );
  }
}
