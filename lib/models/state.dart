class State {
  State({
    this.id,
    this.name,
    this.countryId,
    this.countryCode,
    this.countryName,
    this.stateCode,
    this.type,
    this.latitude,
    this.longitude,
  });
  late final int? id;
  late final String? name;
  late final int? countryId;
  late final String? countryCode;
  late final String? countryName;
  late final String? stateCode;
  late final String? type;
  late final String? latitude;
  late final String? longitude;

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    countryCode = json['country_code'];
    countryName = json['country_name'];
    stateCode = json['state_code'];
    type = null;
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    data['country_code'] = countryCode;
    data['country_name'] = countryName;
    data['state_code'] = stateCode;
    data['type'] = type;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
