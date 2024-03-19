class Plan {
  String? plan;
  String? sport;
  String? category;

  Plan({this.plan, this.sport, this.category});

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        plan: json['plan'] as String?,
        sport: json['sport'] as String?,
        category: json['category'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'plan': plan,
        'sport': sport,
        'category': category,
      };
}
