import 'package:equatable/equatable.dart';

class Chapter {
  final int chapterNumber;
  final String title;
  final String description;

  Chapter({
    required this.title,
    required this.description,
    required this.chapterNumber
  });

  // Convert Chapter to Map for serialization
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }

  // Create a Chapter from Map
  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      title: json['title'] as String,
      description: json['description'] as String,
      chapterNumber: json['chapterNumber']
    );
  }
}

class Course extends Equatable {
  final String title;
  final String description;
  final String instructor;
  final String youtubeLink;
  final String imagePath;
  final String language;
  final String coursTatuts;
  final List<Chapter> chapters; // Liste des chapitres

  const Course({
    required this.title,
    required this.description,
    required this.instructor,
    required this.youtubeLink,
    required this.imagePath,
    required this.language,
    required this.coursTatuts,
    required this.chapters,
  });

  // Convert Course to Map for serialization
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'instructor': instructor,
      'youtubeLink': youtubeLink,
      'imagePath': imagePath,
      'language': language,
      'coursTatuts': coursTatuts,
      'chapters': chapters
          .map((chapter) => chapter.toJson())
          .toList(), // Serialize chapters
    };
  }

  // Create a Course from Map
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'] as String,
      description: json['description'] as String,
      instructor: json['instructor'] as String,
      youtubeLink: json['youtubeLink'] as String,
      imagePath: json['imagePath'] as String,
      language: json['language'] as String,
      coursTatuts: json['coursTatuts'] as String,
      chapters: (json['chapters'] as List)
          .map((chapterJson) =>
              Chapter.fromJson(chapterJson as Map<String, dynamic>))
          .toList(), // Deserialize chapters
    );
  }

  // Copy with method to update fields
  Course copyWith({
    String? title,
    String? description,
    String? instructor,
    String? youtubeLink,
    String? imagePath,
    String? language,
    String? coursTatuts,
    List<Chapter>? chapters,
  }) {
    return Course(
      title: title ?? this.title,
      description: description ?? this.description,
      instructor: instructor ?? this.instructor,
      youtubeLink: youtubeLink ?? this.youtubeLink,
      imagePath: imagePath ?? this.imagePath,
      language: language ?? this.language,
      coursTatuts: coursTatuts ?? this.coursTatuts,
      chapters: chapters ?? this.chapters,
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
        chapters, // Include chapters in comparison for Equatable
      ];
}
