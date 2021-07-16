// To parse this JSON data, do
//
//     final randomCharacter = randomCharacterFromJson(jsonString);

import 'dart:convert';

String randomCharacterToJson(RandomCharacter data) =>
    json.encode(data.toJson());

class RandomCharacter {
  static List<RandomCharacter> randomCharacterFromJson(List str) {
    return str.map((data) {
      return RandomCharacter.fromJson(data);
    }).toList();
  }

  RandomCharacter({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.nickname,
    required this.appearance,
    required this.portrayed,
    required this.category,
    required this.betterCallSaulAppearance,
  });

  int charId;
  String name;
  String birthday;
  List<String> occupation;
  String img;
  String status;
  String nickname;
  List<int> appearance;
  String portrayed;
  String category;
  String betterCallSaulAppearance;

  factory RandomCharacter.fromJson(Map<String, dynamic> json) =>
      RandomCharacter(
        charId: json["char_id"],
        name: json["name"],
        birthday: json["birthday"] != null ? json["birthday"] : "unknown",
        occupation: json["occupation"] != null
            ? List<String>.from(json["occupation"].map((x) => x))
            : [],
        img: json["img"],
        status: json["status"],
        nickname: json["nickname"],
        appearance: json["appearance"] != null
            ? List<int>.from(json["appearance"].map((x) => x))
            : [],
        portrayed: json["portrayed"],
        category: json["category"],
        betterCallSaulAppearance: json["better_call_saul_appearance"] != null
            ? json["better_call_saul_appearance"]
            : "none",
      );

  Map<String, dynamic> toJson() => {
        "char_id": charId,
        "name": name,
        "birthday": birthday,
        "occupation": List<dynamic>.from(occupation.map((x) => x)),
        "img": img,
        "status": status,
        "nickname": nickname,
        "appearance": List<dynamic>.from(appearance.map((x) => x)),
        "portrayed": portrayed,
        "category": category,
        "better_call_saul_appearance": betterCallSaulAppearance,
      };
}
//All Quotes
//---------------------------------------

String quotesToJson(List<Quotes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quotes {
  static List<Quotes> quotesFromJson(List str) {
    return str.map((data) {
      return Quotes.fromJson(data);
    }).toList();
  }

  Quotes({
    required this.quoteId,
    required this.quote,
    required this.author,
    required this.series,
  });

  int quoteId;
  String quote;
  String author;
  String series;

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        quoteId: json["quote_id"],
        quote: json["quote"],
        author: json["author"],
        series: json["series"],
      );

  Map<String, dynamic> toJson() => {
        "quote_id": quoteId,
        "quote": quote,
        "author": author,
        "series": series,
      };
}

//All Characters
//---------------------------------------

String charactersToJson(List<AllCharacters> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllCharacters {
  static List<AllCharacters> charactersFromJson(List str) {
    return str.map((data) {
      return AllCharacters.fromJson(data);
    }).toList();
  }

  AllCharacters({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.nickname,
    required this.appearance,
    required this.portrayed,
    required this.category,
    required this.betterCallSaulAppearance,
  });

  int charId;
  String name;
  Birthday birthday;
  List<String> occupation;
  String img;
  Status status;
  String nickname;
  List<int> appearance;
  String portrayed;
  Category category;
  List<int> betterCallSaulAppearance;

  factory AllCharacters.fromJson(Map<String, dynamic> json) => AllCharacters(
        charId: json["char_id"],
        name: json["name"],
        birthday: birthdayValues.map[json["birthday"]] as Birthday,
        occupation: List<String>.from(json["occupation"].map((x) => x)),
        img: json["img"],
        status: statusValues.map[json["status"]] as Status,
        nickname: json["nickname"],
        appearance: List<int>.from(json["appearance"].map((x) => x)),
        portrayed: json["portrayed"],
        category: categoryValues.map[json["category"]] as Category,
        betterCallSaulAppearance:
            List<int>.from(json["better_call_saul_appearance"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "char_id": charId,
        "name": name,
        "birthday": birthdayValues.reverse[birthday],
        "occupation": List<dynamic>.from(occupation.map((x) => x)),
        "img": img,
        "status": statusValues.reverse[status],
        "nickname": nickname,
        "appearance": List<dynamic>.from(appearance.map((x) => x)),
        "portrayed": portrayed,
        "category": categoryValues.reverse[category],
        "better_call_saul_appearance":
            List<dynamic>.from(betterCallSaulAppearance.map((x) => x)),
      };
}

enum Birthday {
  THE_09071958,
  THE_09241984,
  THE_08111970,
  THE_07081993,
  UNKNOWN
}

final birthdayValues = EnumValues({
  "07-08-1993": Birthday.THE_07081993,
  "08-11-1970": Birthday.THE_08111970,
  "09-07-1958": Birthday.THE_09071958,
  "09-24-1984": Birthday.THE_09241984,
  "Unknown": Birthday.UNKNOWN
});

enum Category { BREAKING_BAD, BREAKING_BAD_BETTER_CALL_SAUL, BETTER_CALL_SAUL }

final categoryValues = EnumValues({
  "Better Call Saul": Category.BETTER_CALL_SAUL,
  "Breaking Bad": Category.BREAKING_BAD,
  "Breaking Bad, Better Call Saul": Category.BREAKING_BAD_BETTER_CALL_SAUL
});

enum Status { PRESUMED_DEAD, ALIVE, DECEASED, UNKNOWN }

final statusValues = EnumValues({
  "Alive": Status.ALIVE,
  "Deceased": Status.DECEASED,
  "Presumed dead": Status.PRESUMED_DEAD,
  "Unknown": Status.UNKNOWN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return reverseMap;
  }
}
