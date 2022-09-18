part of 'models.dart';


class MyDonation extends Equatable {
  final int? id;
  final String? title;
  final String? slug;
  final int? categoryId;
  final int? targetDonation;
  final String? maxDate;
  final String? description;
  final String? image;
  final String? name;

  const MyDonation({
    this.id,
    this.title,
    this.slug,
    this.categoryId,
    this.targetDonation,
    this.maxDate,
    this.description,
    this.image,
    this.name,
  });

  MyDonation copyWith({
    int? id,
    String? title,
    String? slug,
    int? categoryId,
    int? targetDonation,
    String? maxDate,
    String? description,
    String? image,
    String? name,
  }) =>
      MyDonation(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        categoryId: categoryId ?? this.categoryId,
        targetDonation: targetDonation ?? this.targetDonation,
        maxDate: maxDate ?? this.maxDate,
        description: description ?? this.description,
        image: image ?? this.image,
        name: name ?? this.name,
      );

  factory MyDonation.fromJSON(Map<String, dynamic> data) => MyDonation(
        id: data['id'],
        title: data['title'],
        slug: data['slug'],
        categoryId: data['category_id'],
        targetDonation: data['target_donation'],
        maxDate: data['max_date'],
        description: data['description'],
        image: data['image'],
        name: data['user']['name'],
      );

  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        categoryId,
        targetDonation,
        maxDate,
        description,
        image,
        name
      ];
}
