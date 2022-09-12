part of 'models.dart';

class Donation extends Equatable {
  final int? id;
  final String? title;
  final String? slug;
  final int? categoryId;
  final double? targetDonation;
  final DateTime? maxDate;
  final String? description;
  final String? image;

  const Donation(
      {this.id,
      this.title,
      this.slug,
      this.categoryId,
      this.targetDonation,
      this.maxDate,
      this.description,
      this.image});

  Donation copyWith({
    int? id,
    String? title,
    String? slug,
    int? categoryId,
    double? targetDonation,
    DateTime? maxDate,
    String? description,
    String? image,
  }) =>
      Donation(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        categoryId: categoryId ?? this.categoryId,
        targetDonation: targetDonation ?? this.targetDonation,
        maxDate: maxDate ?? this.maxDate,
        description: description ?? this.description,
        image: image ?? this.image,
      );

  factory Donation.fromJSON(Map<String, dynamic> data) => Donation(
        id: data['id'],
        title: data['title'],
        slug: data['slug'],
        categoryId: data['category_id'],
        targetDonation: data['target_donation'],
        maxDate: data['max_date'],
        description: data['description'],
        image: data['image'],
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
        image
      ];
}
