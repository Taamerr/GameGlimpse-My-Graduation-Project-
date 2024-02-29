class Paging {
  num? current;
  num? total;

  Paging({this.current, this.total});

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        current: json['current'] as num?,
        total: json['total'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'current': current,
        'total': total,
      };
}
