// ignore_for_file: use_build_context_synchronously

part of 'pages.dart';

class CampaginDetailPage extends StatelessWidget {
  const CampaginDetailPage({Key? key, this.donation}) : super(key: key);
  final Donation? donation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(
                          0.1,
                        ),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Detail Campaign',
                        style: buttonTextStyle.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.86,
              child: ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 300,
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
                              image: NetworkImage(donation!.image!.toString()),
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
                                    donation!.maxDate.toString(),
                                    style: buttonTextStyle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
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
                            donation!.title.toString(),
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
                              style: buttonTextStyle.copyWith(
                                  color: Colors.black, fontSize: 12),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                          decimalDigits: 0,
                                          locale: 'id-ID',
                                          symbol: 'Rp. ')
                                      .format(
                                    int.parse(donation!.terkumpul!),
                                  ),
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
                                          decimalDigits: 0,
                                          locale: 'id-ID',
                                          symbol: 'Rp. ')
                                      .format(donation!.targetDonation),
                                  style: buttonTextStyle.copyWith(
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 35,
                          width: MediaQuery.of(context).size.width - 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              bool checkToken = await UserServices.checkToken();
                              if (checkToken) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentPage(
                                      donation: donation,
                                    ),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              'Donasi sekarang',
                              style:
                                  buttonTextStyle.copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Penggalang Dana',
                          style: buttonTextStyle.copyWith(
                            color: accentColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          height: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              donation!.name!,
                              style: buttonTextStyle.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Cerita',
                          style: buttonTextStyle.copyWith(
                            color: accentColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          height: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          Bidi.stripHtmlIfNeeded(donation!.description!),
                          style: buttonTextStyle.copyWith(
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
