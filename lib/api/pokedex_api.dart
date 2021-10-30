import 'package:http/http.dart' as http;
import 'package:pokedex/model/pokemon.dart';

String url =
    'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

Future<PokemonModel> getValue() async {
  var response = await http.get(Uri.parse(url));

  late PokemonModel pokemonModel;
  if (response.statusCode == 200) {
    pokemonModel = pokemonModelFromMap(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  return pokemonModel;
}
