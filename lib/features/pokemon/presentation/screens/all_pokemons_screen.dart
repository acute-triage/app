import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/application/router.gr.dart';
import 'package:flutter_starter/common/presentation/widgets/ferry_client_provider_widget.dart';
import 'package:flutter_starter/features/pokemon/data/graphql/__generated__/all_pokemon.req.gql.dart';

@RoutePage()
class AllPokemonsScreen extends StatefulWidget {
  const AllPokemonsScreen({super.key});

  @override
  State<AllPokemonsScreen> createState() => _AllPokemonsScreenState();
}

class _AllPokemonsScreenState extends State<AllPokemonsScreen> {
  @override
  Widget build(BuildContext context) {
    final req = GAllPokemonReq(
      (b) => b
        ..vars.limit = 50
        ..vars.offset = 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Pokemons'),
      ),
      body: FerryOperation(
        request: req,
        data: (response) => ListView.builder(
          itemCount: response.pokemons?.results?.length ?? 0,
          itemBuilder: (context, index) {
            final pokemon = response.pokemons!.results![index]!;

            return ListTile(
              title: Text(pokemon.name),
              onTap: () {
                context.router.push(
                  ViewPokemonRoute(
                    id: pokemon.id,
                    pokemonName: pokemon.name,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
