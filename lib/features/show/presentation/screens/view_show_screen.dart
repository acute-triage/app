import 'package:auto_route/auto_route.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/application/ferry_provider.dart';
import 'package:flutter_starter/common/presentation/widgets/ferry_client_provider_widget.dart';
import 'package:flutter_starter/features/show/data/graphql/__generated__/view_show.data.gql.dart';
import 'package:flutter_starter/features/show/data/graphql/__generated__/view_show.req.gql.dart';

@RoutePage()
class ViewShowScreen extends ConsumerStatefulWidget {
  final String id;
  final String? title;

  const ViewShowScreen({
    super.key,
    required this.id,
    this.title,
  });

  @override
  ConsumerState<ViewShowScreen> createState() => _ViewPokemonScreenState();
}

class _ViewPokemonScreenState extends ConsumerState<ViewShowScreen> {
  late GViewShowReq req;
  GViewShowData_show? show;

  @override
  initState() {
    super.initState();

    req = GViewShowReq(
      (b) => b..vars.id = widget.id.toString(),
    );

    listenForResponse();
  }

  listenForResponse() async {
    final ferry = await ref.read(ferryProvider.selectAsync((value) => value));

    final show = await ferry
        .request(req)
        .firstWhere((response) => response.dataSource != DataSource.Optimistic)
        .then((response) => response.data!.show!);

    setState(() {
      this.show = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(show?.title ?? widget.title ?? 'View Pokemon'),
      ),
      body: FerryOperation(
        request: req,
        data: (response) {
          final show = response.show!;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${show.title}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
