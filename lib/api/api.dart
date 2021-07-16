import 'dart:convert';

import 'package:brba/models/apiModel.dart';
import 'package:http/http.dart' as http;

Future<RandomCharacter> fetchRandomCharacter() async {
  final response = await http
      .get(Uri.parse('https://www.breakingbadapi.com/api/character/random'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return RandomCharacter.fromJson(jsonDecode(response.body)[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Quotes>> fetchQuotes() async {
  final response =
      await http.get(Uri.parse('https://www.breakingbadapi.com/api/quotes'));

  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);

    return Quotes.quotesFromJson(data);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<AllCharacters>> fetchAllCharacters() async {
  final response = await http
      .get(Uri.parse('https://www.breakingbadapi.com/api/characters'));

  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);

    return AllCharacters.charactersFromJson(data);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<AllCharacters>> fecthCharactersByName(name) async {
  final response = await http.get(
      Uri.parse('https://www.breakingbadapi.com/api/characters?name=$name'));

  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);

    return AllCharacters.charactersFromJson(data);
  } else {
    throw Exception('Failed to load album');
  }
}
