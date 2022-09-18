part of 'widgets.dart';

class DonationHistoryPage extends StatelessWidget {
  const DonationHistoryPage({Key? key, this.donation}) : super(key: key);
  final model.Payment? donation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 0.43,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(donation!.image!),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.3)),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5 - 25,
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
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5 - 25,
                child: Text(
                  donation!.maxDate!,
                  style: buttonTextStyle.copyWith(
                      color: accentColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5 - 25,
                child: Text(
                  NumberFormat.currency(
                          locale: 'id-ID', decimalDigits: 0, symbol: 'Rp. ')
                      .format(donation!.amount!),
                  style: buttonTextStyle.copyWith(
                      color: Colors.amber,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5 - 25,
                child: Text(
                  donation!.status!,
                  style: buttonTextStyle.copyWith(
                      color: (donation!.status! == 'success')
                          ? successColor
                          : (donation!.status! == 'pending')
                              ? Colors.amber
                              : Colors.red,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
