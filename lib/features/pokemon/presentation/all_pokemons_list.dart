import 'package:flutter/material.dart';
import 'package:flutter_starter/common/presentation/ferry_client_provider_widget.dart';
import 'package:flutter_starter/features/pokemon/data/graphql/__generated__/all_pokemon.req.gql.dart';

class AllPokemons extends StatefulWidget {
  const AllPokemons({super.key});

  @override
  State<AllPokemons> createState() => _AllPokemonsState();
}

class _AllPokemonsState extends State<AllPokemons> {
  @override
  Widget build(BuildContext context) {
    final req = GAllPokemonReq(
      (b) => b
        ..vars.limit = 50
        ..vars.offset = 0,
    );

    return FerryOperation(
      operationRequest: req,
      data: (response) => ListView.builder(
        itemCount: response.pokemons?.results?.length ?? 0,
        itemBuilder: (context, index) {
          final pokemon = response.pokemons!.results![index]!;

          return ListTile(
            title: Text(pokemon.name),
            onTap: () {
              // Navigator.of(context).pushNamed(
              //   PokemonDetail.routeName,
              //   arguments: pokemon.id,
              // )
            },
          );
        },
      ),
    );
  }
}
