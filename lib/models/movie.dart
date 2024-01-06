class Movie {
  final String title;
  final String bigImage;
  final String description;
  final double rating;

  Movie({
    required this.title,
    required this.bigImage,
    required this.description,
    required this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] as String,
      bigImage: json['big_image'] as String,
      description: json['description'] as String,
      rating: double.tryParse(json['rating'] ?? '') ?? 0.0,
    );
  }
}


