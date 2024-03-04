import 'match_data.dart';
import 'pagination.dart';
import 'rate_limit.dart';
import 'subscription.dart';

class FixturesModel {
  List<MatchData>? data;
  Pagination? pagination;
  List<Subscription>? subscription;
  RateLimit? rateLimit;
  String? timezone;

  FixturesModel({
    this.data,
    this.pagination,
    this.subscription,
    this.rateLimit,
    this.timezone,
  });

  factory FixturesModel.fromJson(Map<String, dynamic> json) => FixturesModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => MatchData.fromJson(e as Map<String, dynamic>))
            .toList(),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
        subscription: (json['subscription'] as List<dynamic>?)
            ?.map((e) => Subscription.fromJson(e as Map<String, dynamic>))
            .toList(),
        rateLimit: json['rate_limit'] == null
            ? null
            : RateLimit.fromJson(json['rate_limit'] as Map<String, dynamic>),
        timezone: json['timezone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'pagination': pagination?.toJson(),
        'subscription': subscription?.map((e) => e.toJson()).toList(),
        'rate_limit': rateLimit?.toJson(),
        'timezone': timezone,
      };
}
