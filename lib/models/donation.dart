// ignore_for_file: must_be_immutable

part of 'models.dart';

class Donation extends Equatable {
  final int? id;
  final String? title;
  final String? slug;
  final int? categoryId;
  final int? targetDonation;
  final String? maxDate;
  final String? description;
  final String? image;
  final String? name;
  final String? terkumpul;
  final double? percent;

  const Donation(
      {this.id,
      this.title,
      this.slug,
      this.categoryId,
      this.targetDonation,
      this.maxDate,
      this.description,
      this.image,
      this.name,
      this.terkumpul,
      this.percent});

  Donation copyWith({
    int? id,
    String? title,
    String? slug,
    int? categoryId,
    int? targetDonation,
    String? maxDate,
    String? description,
    String? image,
    String? name,
    String? terkumpul,
    double? percent,
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
          name: name ?? this.name,
          terkumpul: terkumpul ?? this.terkumpul,
          percent: percent ?? this.percent);

  factory Donation.fromJSON(Map<String, dynamic> data) => Donation(
      id: data['id'],
      title: data['title'],
      slug: data['slug'],
      categoryId: data['category_id'],
      targetDonation: data['target_donation'],
      maxDate: data['max_date'],
      description: data['description'],
      image: data['image'],
      name: data['user']['name'],
      terkumpul: data['sum_donation'][0]['total'],
      percent: (double.parse(data['sum_donation'][0]['total']) * 100) /
          (data['target_donation'] as int).toDouble());

  factory Donation.fromSearch(Map<String, dynamic> data) => Donation(
      id: data['id'],
      title: data['title'],
      slug: data['slug'],
      categoryId: data['category_id'],
      targetDonation: data['target_donation'],
      maxDate: data['max_date'],
      description: data['description'],
      image: data['image'],
      name: 'Yayasan Al-Irsaydi',
      terkumpul: data['sum_donation'][0]['total'],
      percent: (double.parse(data['sum_donation'][0]['total']) * 100) /
          (data['target_donation'] as int).toDouble());

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
        name,
        terkumpul,
        percent
      ];
}
