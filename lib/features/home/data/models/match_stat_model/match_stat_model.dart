import 'data.dart';
import 'rate_limit.dart';
import 'subscription.dart';

class MatchStatModel {
  Data? data;
  List<Subscription>? subscription;
  RateLimit? rateLimit;
  String? timezone;

  MatchStatModel({
    this.data,
    this.subscription,
    this.rateLimit,
    this.timezone,
  });

  factory MatchStatModel.fromJson(Map<String, dynamic> json) {
    return MatchStatModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
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
        'data': data?.toJson(),
        'subscription': subscription?.map((e) => e.toJson()).toList(),
        'rate_limit': rateLimit?.toJson(),
        'timezone': timezone,
      };
}
