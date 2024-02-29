import 'paging.dart';
import 'parameters.dart';
import 'response.dart';

class FixturesModel {
  String? fixtureModelGet;
  Parameters? parameters;
  List<dynamic>? errors;
  num? results;
  Paging? paging;
  List<Response>? response;

  FixturesModel({
    this.fixtureModelGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  factory FixturesModel.fromJson(Map<String, dynamic> json) => FixturesModel(
        fixtureModelGet: json['get'] as String?,
        parameters: json['parameters'] == null
            ? null
            : Parameters.fromJson(json['parameters'] as Map<String, dynamic>),
        errors: json['errors'] as List<dynamic>?,
        results: json['results'] as num?,
        paging: json['paging'] == null
            ? null
            : Paging.fromJson(json['paging'] as Map<String, dynamic>),
        response: (json['response'] as List<dynamic>?)
            ?.map((e) => Response.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'get': fixtureModelGet,
        'parameters': parameters?.toJson(),
        'errors': errors,
        'results': results,
        'paging': paging?.toJson(),
        'response': response?.map((e) => e.toJson()).toList(),
      };
}
