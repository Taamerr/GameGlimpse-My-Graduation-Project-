class State {
  int? id;
  String? shortName;

  State({this.id, this.shortName});

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json['id'] as int?,
        shortName: json['short_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'short_name': shortName,
      };
}
