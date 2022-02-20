import 'dart:convert';

class Country {
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int recovered;
  final int active;
  final int critical;

  Country({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.recovered,
    this.active,
    this.critical,
  });

  Country copyWith({
    String country,
    int cases,
    int todayCases,
    int deaths,
    int recovered,
    int active,
    int critical,
  }) {
    return Country(
      country: country ?? this.country,
      cases: cases ?? this.cases,
      todayCases: todayCases ?? this.todayCases,
      deaths: deaths ?? this.deaths,
      recovered: recovered ?? this.recovered,
      active: active ?? this.active,
      critical: critical ?? this.critical,
    );
  }

  Country merge(Country model) {
    return Country(
      country: model.country ?? country,
      cases: model.cases ?? cases,
      todayCases: model.todayCases ?? todayCases,
      deaths: model.deaths ?? deaths,
      recovered: model.recovered ?? recovered,
      active: model.active ?? active,
      critical: model.critical ?? critical,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'cases': cases,
      'todayCases': todayCases,
      'deaths': deaths,
      'recovered': recovered,
      'active': active,
      'critical': critical,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Country(
      country: map['country'],
      cases: map['cases'],
      todayCases: map['todayCases'],
      deaths: map['deaths'],
      recovered: map['recovered'],
      active: map['active'],
      critical: map['critical'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Country(country: $country, cases: $cases, todayCases: $todayCases, deaths: $deaths, recovered: $recovered, active: $active, critical: $critical)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Country &&
        other.country == country &&
        other.cases == cases &&
        other.todayCases == todayCases &&
        other.deaths == deaths &&
        other.recovered == recovered &&
        other.active == active &&
        other.critical == critical;
  }

  @override
  int get hashCode {
    return country.hashCode ^
        cases.hashCode ^
        todayCases.hashCode ^
        deaths.hashCode ^
        recovered.hashCode ^
        active.hashCode ^
        critical.hashCode;
  }
}
