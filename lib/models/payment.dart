part of 'models.dart';

class Payment extends Equatable {
  final int? id;
  final String? invoice;
  final int? campaignId;
  final int? donaturId;
  final int? amount;
  final String? pray;
  final String? snapToken;
  final String? status;
  final String? title;
  final String? slug;
  final int? targetDonation;
  final String? maxDate;
  final String? description;
  final String? image;

  const Payment(
      {this.id,
      this.invoice,
      this.campaignId,
      this.donaturId,
      this.amount,
      this.pray,
      this.snapToken,
      this.status,
      this.title,
      this.slug,
      this.targetDonation,
      this.maxDate,
      this.description,
      this.image});

  Payment copyWith(
          {int? id,
          String? invoice,
          int? campaignId,
          int? donaturId,
          int? amount,
          String? pray,
          String? snapToken,
          String? status,
          String? title,
          String? slug,
          int? targetDonation,
          String? maxDate,
          String? description,
          String? image}) =>
      Payment(
          id: id ?? this.id,
          invoice: invoice ?? this.invoice,
          campaignId: campaignId ?? this.campaignId,
          donaturId: donaturId ?? this.donaturId,
          amount: amount ?? this.amount,
          pray: pray ?? this.pray,
          snapToken: snapToken ?? this.snapToken,
          status: status ?? this.status,
          title: title ?? this.title,
          slug: slug ?? this.slug,
          targetDonation: targetDonation ?? this.targetDonation,
          maxDate: maxDate ?? this.maxDate,
          description: description ?? this.description,
          image: image ?? this.image);

  factory Payment.fromJSON(Map<String, dynamic> data) => Payment(
        id: data['id'],
        invoice: data['invoce'],
        campaignId: data['campaign_id'],
        donaturId: data['donatur_id'],
        amount: data['amount'],
        pray: data['pray'],
        snapToken: data['snap_token'],
        status: data['status'],
        title: data['campaign']['title'],
        slug: data['campaign']['slug'],
        targetDonation: data['campaign']['target_donation'],
        maxDate: data['campaign']['max_date'],
        description: data['campaign']['description'],
        image: data['campaign']['image'],
      );

  @override
  List<Object?> get props => [
        id,
        invoice,
        campaignId,
        donaturId,
        amount,
        pray,
        snapToken,
        status,
        title,
        slug,
        targetDonation,
        maxDate,
        description,
        image
      ];
}
