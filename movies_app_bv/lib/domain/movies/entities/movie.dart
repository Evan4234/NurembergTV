class Movie {
  final String id;
  final String title;
  final String description;
  final String posterPath;
  final double rating;
  final DateTime releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.posterPath,
    required this.rating,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id']?.toString() ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      posterPath: json['posterPath'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['releaseDate'] != null
          ? DateTime.parse(json['releaseDate'] as String)
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'posterPath': posterPath,
        'rating': rating,
        'releaseDate': releaseDate.toIso8601String(),
      };
}
