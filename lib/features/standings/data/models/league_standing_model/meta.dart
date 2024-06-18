class Meta {
  String? trialEndsAt;
  dynamic endsAt;
  int? currentTimestamp;

  Meta({this.trialEndsAt, this.endsAt, this.currentTimestamp});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        trialEndsAt: json['trial_ends_at'] as String?,
        endsAt: json['ends_at'] as dynamic,
        currentTimestamp: json['current_timestamp'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'trial_ends_at': trialEndsAt,
        'ends_at': endsAt,
        'current_timestamp': currentTimestamp,
      };
}
