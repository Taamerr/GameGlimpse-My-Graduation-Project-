import 'goals.dart';

class Home {
  num? played;
  num? win;
  num? draw;
  num? lose;
  Goals? goals;

  Home({this.played, this.win, this.draw, this.lose, this.goals});

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        played: json['played'] as num?,
        win: json['win'] as num?,
        draw: json['draw'] as num?,
        lose: json['lose'] as num?,
        goals: json['goals'] == null
            ? null
            : Goals.fromJson(json['goals'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'played': played,
        'win': win,
        'draw': draw,
        'lose': lose,
        'goals': goals?.toJson(),
      };
}
