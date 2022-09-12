part of 'widgets.dart';

class CampaignCard extends StatelessWidget {
  const CampaignCard(
      {Key? key,
      this.image,
      this.title,
      this.name,
      this.percent,
      this.terkumpul,
      this.target,
      this.time})
      : super(key: key);
  final String? image;
  final String? title;
  final String? name;
  final String? time;
  final double? percent, terkumpul, target;
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
                image: AssetImage(image!),
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
                      time!,
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
              title!,
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
              name!,
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
                '${percent!}%',
                style:
                    buttonTextStyle.copyWith(color: Colors.black, fontSize: 12),
              ),
              backgroundColor: Colors.grey[400],
              percent: 0.7,
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
                    terkumpul!.toString(),
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
                    target!.toString(),
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
