import 'datum.dart';
import 'rate_limit.dart';
import 'subscription.dart';

class LeagueStandingModel {
  List<Datum>? data;
  List<Subscription>? subscription;
  RateLimit? rateLimit;
  String? timezone;

  LeagueStandingModel({
    this.data,
    this.subscription,
    this.rateLimit,
    this.timezone,
  });

  factory LeagueStandingModel.fromJson(Map<String, dynamic> json) {
    return LeagueStandingModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscription: (json['subscription'] as List<dynamic>?)
          ?.map((e) => Subscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      rateLimit: json['rate_limit'] == null
          ? null
          : RateLimit.fromJson(json['rate_limit'] as Map<String, dynamic>),
      timezone: json['timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'subscription': subscription?.map((e) => e.toJson()).toList(),
        'rate_limit': rateLimit?.toJson(),
        'timezone': timezone,
      };
}
