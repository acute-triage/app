import 'package:auto_route/auto_route.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/application/ferry_provider.dart';
import 'package:flutter_starter/common/presentation/widgets/ferry_client_provider_widget.dart';
import 'package:flutter_starter/features/pokemon/data/graphql/__generated__/pokemon_detail.data.gql.dart';
import 'package:flutter_starter/features/pokemon/data/graphql/__generated__/pokemon_detail.req.gql.dart';

@RoutePage()
class ViewPokemonScreen extends ConsumerStatefulWidget {
  final int id;
  final String? pokemonName;

  const ViewPokemonScreen({
    super.key,
    required this.id,
    this.pokemonName,
  });

  @override
  ConsumerState<ViewPokemonScreen> createState() => _ViewPokemonScreenState();
}

class _ViewPokemonScreenState extends ConsumerState<ViewPokemonScreen> {
  late GPokemonDetailReq req;
  GPokemonDetailData_pokemon? pokemon;

  @override
  initState() {
    super.initState();

    req = GPokemonDetailReq(
      (b) => b..vars.id = widget.id.toString(),
    );

    listenForResponse();
  }

  listenForResponse() async {
    final ferry = await ref.read(ferryProvider.selectAsync((value) => value));

    final pokemon = await ferry
        .request(req)
        .firstWhere((response) => response.dataSource != DataSource.Optimistic)
        .then((response) => response.data!.pokemon!);

    setState(() {
      this.pokemon = pokemon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon?.name ?? widget.pokemonName ?? 'View Pokemon'),
      ),
      body: FerryOperation(
        request: req,
        data: (response) {
          final pokemon = response.pokemon!;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${pokemon.name}'),
                Text('Height: ${pokemon.height!.in_meter}'),
                Text('Weight: ${pokemon.weight!.in_kg}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
