library flutter_countries;

import 'dart:convert';
import 'package:flutter/services.dart';

import 'models/city.dart';
import 'models/state.dart';
import 'models/country.dart';

export 'models/city.dart';
export 'models/country.dart';
export 'models/state.dart';

const _jsonPathCities = 'packages/flutter_countries/lib/assets/cities.json';
const _jsonPathStates = 'packages/flutter_countries/lib/assets/states.json';
const _jsonPathCountries =
    'packages/flutter_countries/lib/assets/countries.json';

Future<List> _getJson(String jsonFilePath) async {
  final string = await rootBundle.loadString(jsonFilePath);
  return jsonDecode(string) as List;
}

Future<List<Country>> _getCountries() async {
  final data = await _getJson(_jsonPathCountries);
  return data.map((e) => Country.fromJson(e)).toList();
}

Future<List<City>> _getCities() async {
  final data = await _getJson(_jsonPathCities);
  return data.map((e) => City.fromJson(e)).toList();
}

Future<List<State>> _getStates() async {
  final data = await _getJson(_jsonPathStates);
  return data.map((e) => State.fromJson(e)).toList();
}

List<T> _query<T>(
    List<T> objects, Iterable<T> Function(List<T> objects) query) {
  final nonNull = objects.where((element) => element != null).toList();
  return query(nonNull).toList();
}

/// A class of static methods to retrieve a `Country` by its properties.
/// Additionally, `toJson()` methods are provided for each `Country` class.
class Countries {
  static Future<List<Country>> get all async => await _getCountries();

  /// Returns a `List` of `Country` containing a substring in its `id`.
  static Future<List<Country>> byId(String id) async => _query<Country>(
          await _getCountries(),
          (objects) => objects.where((e) => e.id!.toString().contains(id)))
      .toList();

  /// Returns a `List` of `Country` containing a substring in its `name`.
  static Future<List<Country>> byName(String name) async => _query<Country>(
      await _getCountries(),
      (objects) => objects.where((e) => e.name!.contains(name))).toList();

  /// Returns a `List` of `Country` containing a substring in its `tld`.
  static Future<List<Country>> byTld(String tld) async => _query<Country>(
      await _getCountries(),
      (objects) => objects.where((e) => e.tld!.contains(tld))).toList();

  /// Returns a `List` of `Country` containing a substring in its `tld`.
  static Future<List<Country>> byRegion(String region) async => _query<Country>(
      await _getCountries(),
      (objects) => objects.where((e) => e.region!.contains(region))).toList();

  /// Returns a `List` of `Country` containing a substring in its `subRegion`.
  static Future<List<Country>> bySubRegion(String subRegion) async =>
      _query<Country>(
          await _getCountries(),
          (objects) =>
              objects.where((e) => e.subregion!.contains(subRegion))).toList();

  /// Returns a `List` of `Country` containing a substring in its `longitude` and `latitude`.
  static Future<List<Country>> byCoords(
          String longitude, String latitude) async =>
      _query<Country>(
          await _getCountries(),
          (objects) => objects.where((e) =>
              e.longitude!.contains(longitude) &&
              e.latitude!.contains(latitude))).toList();

  /// Returns a `List` of `Country` containing a substring in its `currencyName`.
  static Future<List<Country>> byCurrencyName(String currencyName) async =>
      _query<Country>(
              await _getCountries(),
              (objects) =>
                  objects.where((e) => e.currencyName!.contains(currencyName)))
          .toList();

  /// Returns a `List` of `Country` containing a substring in its `capital`.
  static Future<List<Country>> byCapital(String capital) async =>
      _query<Country>(await _getCountries(),
              (objects) => objects.where((e) => e.capital!.contains(capital)))
          .toList();

  /// Returns a `List` of `Country` containing a substring in its `phoneCode`.
  static Future<List<Country>> byPhoneCode(String phoneCode) async =>
      _query<Country>(
          await _getCountries(),
          (objects) =>
              objects.where((e) => e.phoneCode!.contains(phoneCode))).toList();

  /// Returns a `List` of `Country` containing a substring in its `numbericCode`.
  static Future<List<Country>> byNumericCode(String numericCode) async =>
      _query<Country>(
              await _getCountries(),
              (objects) =>
                  objects.where((e) => e.numericCode!.contains(numericCode)))
          .toList();

  /// Returns a `List` of `Country` containing a substring in its `iso2`.
  static Future<List<Country>> byIso2(String iso2) async => _query<Country>(
      await _getCountries(),
      (objects) => objects.where((e) => e.iso2!.contains(iso2))).toList();

  /// Returns a `List` of `Country` containing a substring in its `iso3`.
  static Future<List<Country>> byIso3(String iso3) async => _query<Country>(
      await _getCountries(),
      (objects) => objects.where((e) => e.iso3!.contains(iso3))).toList();

  /// Returns a `List` of `Country` containing a substring in its `native`.
  static Future<List<Country>> byNative(String native) async => _query<Country>(
      await _getCountries(),
      (objects) => objects.where((e) => e.native!.contains(native))).toList();

  /// Returns a `List` of `Country` containing a substring in its `timeZoneZoneName`.
  static Future<List<Country>> byTimeZoneZoneName(String zoneName) async {
    final result = <Country>[];
    final countries = await _getCountries();
    for (var country in countries) {
      if (country.timezones != null) {
        for (var timezone in country.timezones!) {
          if (timezone.zoneName != null &&
              timezone.zoneName!.contains(zoneName)) {
            result.add(country);
          }
        }
      }
    }
    return result;
  }

  /// Returns a `List` of `Country` containing a substring in its `timeZoneGmtOffset`.
  static Future<List<Country>> byTimeZoneGmtOffset(
      String timeZoneGmtOffset) async {
    final result = <Country>[];
    final countries = await _getCountries();
    for (var country in countries) {
      if (country.timezones != null) {
        for (var timezone in country.timezones!) {
          if (timezone.gmtOffset != null &&
              timezone.gmtOffset!.toString().contains(timeZoneGmtOffset)) {
            result.add(country);
          }
        }
      }
    }
    return result;
  }

  /// Returns a `List` of `Country` containing a substring in its `timeZoneGmtOffsetName`.
  static Future<List<Country>> byTimeZoneGmtOffsetName(
      String gmtOffsetName) async {
    final result = <Country>[];
    final countries = await _getCountries();
    for (var country in countries) {
      if (country.timezones != null) {
        for (var timezone in country.timezones!) {
          if (timezone.gmtOffsetName != null &&
              timezone.gmtOffsetName!.contains(gmtOffsetName)) {
            result.add(country);
          }
        }
      }
    }
    return result;
  }

  /// Returns a `List` of `Country` containing a substring in its `timeZoneGmtOffsetName`.
  static Future<List<Country>> byTimeZoneAbbreviation(
      String timeZoneAbbreviation) async {
    final result = <Country>[];
    final countries = await _getCountries();
    for (var country in countries) {
      if (country.timezones != null) {
        for (var timezone in country.timezones!) {
          if (timezone.abbreviation != null &&
              timezone.abbreviation!.contains(timeZoneAbbreviation)) {
            result.add(country);
          }
        }
      }
    }
    return result;
  }

  /// Returns a `List` of `Country` containing a substring in its `timeZoneTzName`.
  static Future<List<Country>> byTimeZoneTzName(String timeZoneTzName) async {
    final result = <Country>[];
    final countries = await _getCountries();
    for (var country in countries) {
      if (country.timezones != null) {
        for (var timezone in country.timezones!) {
          if (timezone.tzName != null &&
              timezone.tzName!.contains(timeZoneTzName)) {
            result.add(country);
          }
        }
      }
    }
    return result;
  }

  /// Returns a `List` of `Country` containing a substring in its `translation`.
  static Future<List<Country>> byTranslation(String translation) async =>
      _query<Country>(
              await _getCountries(),
              (objects) => objects.where(
                  (e) => e.translations!.toJson().values.contains(translation)))
          .toList();
}

/// A class of static methods that retrieve a `City` by its properties.
/// Additionally, `toJson()` methods are provided for each `Country` class.
class Cities {
  /// Returns a `List` of all `City`'s.
  /// **NOTE** Retreiving all cities and pushing to your Flutter app will probably
  /// probably crash it, if not, bog it down! Narrow down yoeu results to preceisly
  /// what data you required by using the other methods provided.
  static Future<List<City>> get all async => await _getCities();

  /// Returns a `List` of `City`'s containing a substring in its `id`.
  static Future<List<City>> byId(String id) async => _query<City>(
          await _getCities(),
          (objects) =>
              objects.where((element) => element.id!.toString().contains(id)))
      .toList();

  /// Returns a `List` of `City`'s containing a substring in its `name`.
  static Future<List<City>> byName(String name) async => _query<City>(
          await _getCities(),
          (objects) => objects.where((element) => element.name!.contains(name)))
      .toList();

  /// Returns a `List` of `City`'s containing a substring in its `StateId`.
  static Future<List<City>> byStateId(String stateId) async => _query<City>(
      await _getCities(),
      (objects) => objects.where(
          (element) => element.stateId!.toString().contains(stateId))).toList();

  /// Returns a `List` of `City`'s containing a substring in its `stateCode`.
  static Future<List<City>> byStateCode(String stateCode) async => _query<City>(
      await _getCities(),
      (objects) =>
          objects.where((element) => element.stateCode! == stateCode)).toList();

  /// Returns a `List` of `City`'s containing a substring in its `stateName`.
  static Future<List<City>> byStateName(String stateName) async => _query<City>(
      await _getCities(),
      (objects) =>
          objects.where((element) => element.stateName! == stateName)).toList();

  /// Returns a `List` of `City`'s containing a substring in its `countryId`.
  static Future<List<City>> bycountryID(String countryId) async => _query<City>(
          await _getCities(),
          (objects) => objects.where(
              (element) => element.countryId!.toString().contains(countryId)))
      .toList();

  /// Returns a `List` of `City`'s containing a substring in its `countryCode`.
  static Future<List<City>> byCountryCode(
          String countryCode) async =>
      _query<City>(
          await _getCities(),
          (objects) => objects.where((element) =>
              element.countryCode!.toString().contains(countryCode))).toList();

  /// Returns a `List` of `City`'s containing a substring in its `countryName`.
  static Future<List<City>> byCountryName(
          String countryName) async =>
      _query<City>(
          await _getCities(),
          (objects) => objects.where((element) =>
              element.countryName!.toString().contains(countryName))).toList();

  /// Returns a `List` of `City`'s containing a substring in its `longitude` andd `latitude`.
  static Future<List<City>> byCoords(String latitude, String longitude) async =>
      _query<City>(
          await _getCities(),
          (objects) => objects.where((element) =>
              element.latitude!.toString().contains(latitude) &&
              element.longitude!.toString().contains(longitude))).toList();

  /// Returns a `List` of `City`'s containing a substring in its `longitude`.
  static Future<List<City>> byLongitude(String longitude) async => _query<City>(
          await _getCities(),
          (objects) => objects.where(
              (element) => element.longitude!.toString().contains(longitude)))
      .toList();

  /// Returns a `List` of `City`'s containing a substring in its `latitude`.
  static Future<List<City>> byLatitude(String latitude) async => _query<City>(
          await _getCities(),
          (objects) => objects.where(
              (element) => element.latitude!.toString().contains(latitude)))
      .toList();

  /// Returns a `List` of `City`'s containing a substring in its `wikiDataId`.
  static Future<List<City>> byWikiDataId(String wikiDataId) async =>
      _query<City>(
          await _getCities(),
          (objects) => objects.where((element) =>
              element.wikiDataId!.toString().contains(wikiDataId))).toList();
}

/// A class of static methods to retrieve a `State` by its properties.
/// Additionally, `toJson()` methods are provided for each `Country` class.
class States {
  /// Returns a `List` of all `State`'s.
  static Future<List<State>> get all async => await _getStates();

  /// Returns a `List` of `State`'s containing a substring in its `id`.
  static Future<List<State>> byId(String id) async => _query<State>(
          await _getStates(),
          (objects) =>
              objects.where((element) => element.id!.toString().contains(id)))
      .toList();

  /// Returns a `List` of `State`'s containing a substring in its `name`.
  static Future<List<State>> byName(String name) async => _query<State>(
      await _getStates(),
      (objects) => objects.where(
          (element) => element.name!.toString().contains(name))).toList();

  /// Returns a `List` of `State`'s containing a substring in its `countryId`.
  static Future<List<State>> byCountryId(String countryId) async =>
      _query<State>(
          await _getStates(),
          (objects) => objects.where((element) =>
              element.countryId!.toString().contains(countryId))).toList();

  /// Returns a `List` of `State`'s containing a substring in its `countryCode`.
  static Future<List<State>> byCountryCode(String countryCode) async =>
      _query<State>(
          await _getStates(),
          (objects) => objects.where((element) =>
              element.countryCode!.toString().contains(countryCode))).toList();

  /// Returns a `List` of `State`'s containing a substring in its `countryName`.
  static Future<List<State>> byCountryName(String countryName) async =>
      _query<State>(
          await _getStates(),
          (objects) => objects.where((element) =>
              element.countryName!.toString().contains(countryName))).toList();

  /// Returns a `List` of `State`'s containing a substring in its `stateCode`.
  static Future<List<State>> byStateCode(String stateCode) async =>
      _query<State>(
          await _getStates(),
          (objects) => objects.where((element) =>
              element.stateCode!.toString().contains(stateCode))).toList();

  /// Returns a `List` of `State`'s containing a substring in its `type`.
  static Future<List<State>> byType(String type) async => _query<State>(
      await _getStates(),
      (objects) => objects.where(
          (element) => element.type!.toString().contains(type))).toList();

  /// Returns a `List` of `State`'s containing a substring in its `latitude`.
  static Future<List<State>> byLatitude(String latitude) async => _query<State>(
          await _getStates(),
          (objects) => objects.where(
              (element) => element.latitude!.toString().contains(latitude)))
      .toList();

  /// Returns a `List` of `State`'s containing a substring in its `longitude`.
  static Future<List<State>> byLongitude(String longitude) async =>
      _query<State>(
          await _getStates(),
          (objects) => objects.where((element) =>
              element.longitude!.toString().contains(longitude))).toList();

  /// Returns a `List` of `State`'s containing a substring in its `longitude` and `latitude`.
  static Future<List<State>> byCoords(
          String longitude, String latitude) async =>
      _query<State>(
          await _getStates(),
          (objects) => objects.where((element) =>
              element.latitude!.toString().contains(latitude) &&
              element.longitude!.toString().contains(longitude))).toList();
}
