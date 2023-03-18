import 'package:equatable/equatable.dart';

class Exhibit extends Equatable {
  final String title;
  final List<String> images;

  const Exhibit({
    required this.title,
    required this.images,
  });

  factory Exhibit.fromJson(Map<String, dynamic> json) {
    return Exhibit(
      title: json['title'] as String,
      images: (json['images'] as List<dynamic>)
          .map((dynamic e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'images': images,
    };
  }

  @override
  List<Object?> get props => [title, images];
}
