import 'package:json_annotation/json_annotation.dart';

part 'dady_joke.g.dart';

@JsonSerializable()
class DadyJoke {
  final String? id;

  @JsonKey(name: 'joke')
  final String content;

  const DadyJoke({
    this.id,
    required this.content,
  });

  factory DadyJoke.fromJson(Map<String, dynamic> json) => _$DadyJokeFromJson(json);

  Map<String, dynamic> toJson() => _$DadyJokeToJson(this);
}
