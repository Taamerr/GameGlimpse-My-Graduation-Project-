import 'meta.dart';
import 'plan.dart';

class Subscription {
  Meta? meta;
  List<Plan>? plans;
  List<dynamic>? addOns;
  List<dynamic>? widgets;

  Subscription({this.meta, this.plans, this.addOns, this.widgets});

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        plans: (json['plans'] as List<dynamic>?)
            ?.map((e) => Plan.fromJson(e as Map<String, dynamic>))
            .toList(),
        addOns: json['add_ons'] as List<dynamic>?,
        widgets: json['widgets'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'meta': meta?.toJson(),
        'plans': plans?.map((e) => e.toJson()).toList(),
        'add_ons': addOns,
        'widgets': widgets,
      };
}
