import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String title;
  final String description;
  final String instructor;
  final String youtubeLink;
  final String imagePath;
  final String language;
  final String coursTatuts;

  const Course({
    required this.title,
    required this.description,
    required this.instructor,
    required this.youtubeLink,
    required this.imagePath,
    required this.language,
    required this.coursTatuts,
  });

  // Convertir Course en Map pour la sérialisation
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'instructor': instructor,
      'youtubeLink': youtubeLink,
      'imagePath': imagePath,
      'language': language,
      'coursTatuts': coursTatuts,
    };
  }

  // Créer une instance de Course à partir d'une Map
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'] as String,
      description: json['description'] as String,
      instructor: json['instructor'] as String,
      youtubeLink: json['youtubeLink'] as String,
      imagePath: json['imagePath'] as String,
      language: json['language'] as String,
      coursTatuts: json['coursTatuts'] as String,
    );
  }

  // Copier un Course avec des modifications
  Course copyWith({
    String? title,
    String? description,
    String? instructor,
    String? youtubeLink,
    String? imagePath,
    String? language,
    String? coursTatuts,
  }) {
    return Course(
      title: title ?? this.title,
      description: description ?? this.description,
      instructor: instructor ?? this.instructor,
      youtubeLink: youtubeLink ?? this.youtubeLink,
      imagePath: imagePath ?? this.imagePath,
      language: language ?? this.language,
      coursTatuts: coursTatuts ?? this.coursTatuts,
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        instructor,
        youtubeLink,
        imagePath,
        language,
        coursTatuts,
      ];
}