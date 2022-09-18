part of 'widgets.dart';

class CampaignCard extends StatelessWidget {
  const CampaignCard({Key? key, this.donation}) : super(key: key);
  final model.Donation? donation;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 280,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 30,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(donation!.image!),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.3)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      donation!.maxDate!,
                      style: buttonTextStyle.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Text(
              donation!.title!,
              style: buttonTextStyle.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Text(
              donation!.name!,
              style: buttonTextStyle.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              center: Text(
                '${donation!.percent!.round()} %',
                style:
                    buttonTextStyle.copyWith(color: Colors.black, fontSize: 12),
              ),
              backgroundColor: Colors.grey[400],
              percent: (donation!.percent! / 100),
              lineHeight: 20,
              progressColor: successColor,
              barRadius: const Radius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    NumberFormat.currency(
                            decimalDigits: 0, locale: 'id-ID', symbol: 'Rp. ')
                        .format(int.parse(donation!.terkumpul!)),
                    style: buttonTextStyle.copyWith(
                      color: Colors.green,
                    ),
                  ),
                  Text(
                   'dari',
                    style: buttonTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            decimalDigits: 0, locale: 'id-ID', symbol: 'Rp. ')
                        .format(donation!.targetDonation!),
                    style: buttonTextStyle.copyWith(
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
