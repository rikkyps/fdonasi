part of 'models.dart';

class Category extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final List<Donation>? listDonation;

  const Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.listDonation,
  });

  Category copyWith({
    int? id,
    String? name,
    String? slug,
    String? image,
    List<Donation>? listDonation,
  }) =>
      Category(
          id: id ?? this.id,
          name: name ?? this.name,
          slug: slug ?? this.slug,
          image: image ?? this.image,
          listDonation: listDonation ?? this.listDonation);

  factory Category.fromJSON(Map<String, dynamic> data) => Category(
      id: data['id'],
      name: data['name'],
      slug: data['slug'],
      image: data['image'],
      listDonation: data['campaigns']);

  @override
  List<Object?> get props => [id, name, slug, image, listDonation];
}
