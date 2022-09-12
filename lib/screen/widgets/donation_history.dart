part of 'widgets.dart';

class DonationHistoryPage extends StatelessWidget {
  const DonationHistoryPage(
      {Key? key, this.title, this.image, this.date, this.nominal, this.status})
      : super(key: key);
  final String? image, title, date, status, nominal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.grey[200],
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 0.43,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image!),
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
                  title!,
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
                  date!,
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
                  nominal!,
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
                  status!,
                  style: buttonTextStyle.copyWith(
                      color: successColor,
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
