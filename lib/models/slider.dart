part of 'models.dart';

class Slider extends Equatable {
  final int? id;
  final String? image;
  final String? link;

  const Slider({
    this.id,
    this.image,
    this.link,
  });

  Slider copyWith({
    int? id,
    String? image,
    String? link,
  }) =>
      Slider(
        id: id ?? this.id,
        image: image ?? this.image,
        link: link ?? this.link,
      );

  factory Slider.fromJSON(Map<String, dynamic> data) => Slider(
        id: data['id'],
        image: data['image'],
        link: data['link'],
      );

  @override
  List<Object?> get props => [id, image, link];
}
