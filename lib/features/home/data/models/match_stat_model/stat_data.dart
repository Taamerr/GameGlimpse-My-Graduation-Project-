class StatData {
  final int? value;

  StatData({
    this.value,
  });

  factory StatData.fromJson(Map<String, dynamic> json) => StatData(
        value: json['value'] as int?,
      );
}
