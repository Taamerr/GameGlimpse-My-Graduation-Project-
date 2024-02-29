import 'periods.dart';
import 'status.dart';
import 'venue.dart';

class Fixture {
  num? id;
  String? referee;
  String? timezone;
  String? date;
  num? timestamp;
  Periods? periods;
  Venue? venue;
  Status? status;

  Fixture({
    this.id,
    this.referee,
    this.timezone,
    this.date,
    this.timestamp,
    this.periods,
    this.venue,
    this.status,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json['id'] as num?,
        referee: json['referee'] as String?,
        timezone: json['timezone'] as String?,
        date: json['date'] as String?,
        timestamp: json['timestamp'] as num?,
        periods: json['periods'] == null
            ? null
            : Periods.fromJson(json['periods'] as Map<String, dynamic>),
        venue: json['venue'] == null
            ? null
            : Venue.fromJson(json['venue'] as Map<String, dynamic>),
        status: json['status'] == null
            ? null
            : Status.fromJson(json['status'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'referee': referee,
        'timezone': timezone,
        'date': date,
        'timestamp': timestamp,
        'periods': periods?.toJson(),
        'venue': venue?.toJson(),
        'status': status?.toJson(),
      };
}
