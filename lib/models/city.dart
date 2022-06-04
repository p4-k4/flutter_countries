class City {
  City({
    this.id,
    this.name,
    this.stateId,
    this.stateCode,
    this.stateName,
    this.countryId,
    this.countryCode,
    this.countryName,
    this.latitude,
    this.longitude,
    this.wikiDataId,
  });
  late final int? id;
  late final String? name;
  late final int? stateId;
  late final String? stateCode;
  late final String? stateName;
  late final int? countryId;
  late final String? countryCode;
  late final String? countryName;
  late final String? latitude;
  late final String? longitude;
  late final String? wikiDataId;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    stateCode = json['state_code'];
    stateName = json['state_name'];
    countryId = json['country_id'];
    countryCode = json['country_code'];
    countryName = json['country_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    wikiDataId = json['wikiDataId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['state_id'] = stateId;
    data['state_code'] = stateCode;
    data['state_name'] = stateName;
    data['country_id'] = countryId;
    data['country_code'] = countryCode;
    data['country_name'] = countryName;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['wikiDataId'] = wikiDataId;
    return data;
  }
}
