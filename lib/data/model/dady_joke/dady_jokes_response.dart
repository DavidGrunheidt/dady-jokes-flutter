import 'package:json_annotation/json_annotation.dart';

import 'dady_joke.dart';

part 'dady_jokes_response.g.dart';

@JsonSerializable()
class DadyJokesResponse {
  @JsonKey(name: 'current_page')
  final int currentPage;

  @JsonKey(name: 'next_page')
  final int nextPage;

  @JsonKey(name: 'previous_page')
  final int previousPage;

  final List<DadyJoke> results;

  @JsonKey(name: 'search_term')
  final String searchTerm;

  @JsonKey(name: 'total_jokes')
  final int totalJokes;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  const DadyJokesResponse({
    required this.currentPage,
    required this.nextPage,
    required this.previousPage,
    required this.results,
    required this.searchTerm,
    required this.totalJokes,
    required this.totalPages,
  });

  factory DadyJokesResponse.fromJson(Map<String, dynamic> json) => _$DadyJokesResponseFromJson(json);

  const DadyJokesResponse.empty()
      : this(
          currentPage: 0,
          nextPage: 0,
          previousPage: 0,
          results: const [],
          searchTerm: '',
          totalJokes: 0,
          totalPages: 0,
        );

  Map<String, dynamic> toJson() => _$DadyJokesResponseToJson(this);
}
