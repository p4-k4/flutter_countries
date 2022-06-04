// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

class Country {
  Country({
    this.id,
    this.name,
    this.iso3,
    this.iso2,
    this.numericCode,
    this.phoneCode,
    this.capital,
    this.currency,
    this.currencyName,
    this.currencySymbol,
    this.tld,
    this.native,
    this.region,
    this.subregion,
    this.timezones,
    this.translations,
    this.latitude,
    this.longitude,
    this.emoji,
    this.emojiU,
  });

  final int? id;
  final String? name;
  final String? iso3;
  final String? iso2;
  final String? numericCode;
  final String? phoneCode;
  final String? capital;
  final String? currency;
  final String? currencyName;
  final String? currencySymbol;
  final String? tld;
  final String? native;
  final String? region;
  final String? subregion;
  final List<Timezone>? timezones;
  final Translations? translations;
  final String? latitude;
  final String? longitude;
  final String? emoji;
  final String? emojiU;

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        iso3: json["iso3"],
        iso2: json["iso2"],
        numericCode: json["numeric_code"],
        phoneCode: json["phone_code"],
        capital: json["capital"],
        currency: json["currency"],
        currencyName: json["currency_name"],
        currencySymbol: json["currency_symbol"],
        tld: json["tld"],
        native: json["native"],
        region: json["region"],
        subregion: json["subregion"],
        timezones: json["timezones"] == null
            ? null
            : List<Timezone>.from(
                json["timezones"].map((x) => Timezone.fromJson(x))),
        translations: json["translations"] == null
            ? null
            : Translations.fromJson(json["translations"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
        emoji: json["emoji"],
        emojiU: json["emojiU"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iso3": iso3,
        "iso2": iso2,
        "numeric_code": numericCode,
        "phone_code": phoneCode,
        "capital": capital,
        "currency": currency,
        "currency_name": currencyName,
        "currency_symbol": currencySymbol,
        "tld": tld,
        "native": native,
        "region": region,
        "subregion": subregion,
        "timezones": timezones == null
            ? null
            : List<dynamic>.from(timezones!.map((x) => x.toJson())),
        "translations": translations == null ? null : translations!.toJson(),
        "latitude": latitude,
        "longitude": longitude,
        "emoji": emoji,
        "emojiU": emojiU,
      };
}

class Timezone {
  Timezone({
    this.zoneName,
    this.gmtOffset,
    this.gmtOffsetName,
    this.abbreviation,
    this.tzName,
  });

  final String? zoneName;
  final int? gmtOffset;
  final String? gmtOffsetName;
  final String? abbreviation;
  final String? tzName;

  factory Timezone.fromRawJson(String str) =>
      Timezone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        zoneName: json["zoneName"],
        gmtOffset: json["gmtOffset"],
        gmtOffsetName: json["gmtOffsetName"],
        abbreviation: json["abbreviation"],
        tzName: json["tzName"],
      );

  Map<String, dynamic> toJson() => {
        "zoneName": zoneName,
        "gmtOffset": gmtOffset,
        "gmtOffsetName": gmtOffsetName,
        "abbreviation": abbreviation,
        "tzName": tzName,
      };
}

class Translations {
  Translations({
    this.kr,
    this.br,
    this.pt,
    this.nl,
    this.hr,
    this.fa,
    this.de,
    this.es,
    this.fr,
    this.ja,
    this.it,
    this.cn,
    this.tr,
  });

  final String? kr;
  final String? br;
  final String? pt;
  final String? nl;
  final String? hr;
  final String? fa;
  final String? de;
  final String? es;
  final String? fr;
  final String? ja;
  final String? it;
  final String? cn;
  final String? tr;

  factory Translations.fromRawJson(String str) =>
      Translations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        kr: json["kr"],
        br: json["br"],
        pt: json["pt"],
        nl: json["nl"],
        hr: json["hr"],
        fa: json["fa"],
        de: json["de"],
        es: json["es"],
        fr: json["fr"],
        ja: json["ja"],
        it: json["it"],
        cn: json["cn"],
        tr: json["tr"],
      );

  Map<String, dynamic> toJson() => {
        "kr": kr,
        "br": br,
        "pt": pt,
        "nl": nl,
        "hr": hr,
        "fa": fa,
        "de": de,
        "es": es,
        "fr": fr,
        "ja": ja,
        "it": it,
        "cn": cn,
        "tr": tr,
      };
}
