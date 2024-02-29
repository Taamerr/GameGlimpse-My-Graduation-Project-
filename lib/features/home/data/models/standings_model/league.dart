import 'standing.dart';

class League {
  num? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  num? season;
  List<List<Standing>>? standings;

  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
    this.standings,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json['id'] as num?,
        name: json['name'] as String?,
        country: json['country'] as String?,
        logo: json['logo'] as String?,
        flag: json['flag'] as String?,
        season: json['season'] as num?,
        standings: (json['standings'] as List<dynamic>?)
            ?.map((e) => (e as List<dynamic>)
                .map((e) => Standing.fromJson(e as Map<String, dynamic>))
                .toList())
            .toList(),
      );
}
