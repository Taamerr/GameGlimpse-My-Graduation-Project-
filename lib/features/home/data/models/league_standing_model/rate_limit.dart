class RateLimit {
  int? resetsInSeconds;
  int? remaining;
  String? requestedEntity;

  RateLimit({this.resetsInSeconds, this.remaining, this.requestedEntity});

  factory RateLimit.fromJson(Map<String, dynamic> json) => RateLimit(
        resetsInSeconds: json['resets_in_seconds'] as int?,
        remaining: json['remaining'] as int?,
        requestedEntity: json['requested_entity'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'resets_in_seconds': resetsInSeconds,
        'remaining': remaining,
        'requested_entity': requestedEntity,
      };
}
