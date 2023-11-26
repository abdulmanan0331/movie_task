import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieModel {
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
  final String title;
  final String overview;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'release_date')
  final String releaseDate;

  const MovieModel({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
  });

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
