part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({
    Key? key,
  }) : super(key: key);

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
                    onTap: () {},
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
                        'Pembayaran Donasi',
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
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.83,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Program Donasi',
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 15,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/campaign2.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5 -
                                    15,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 15,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      'Sedekah pembangunan masjid korban bencana',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: buttonTextStyle.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      'Yayasan Al-Irsyadi',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: buttonTextStyle.copyWith(
                                          color: accentColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      '30 Hari',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: buttonTextStyle.copyWith(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Nominal Donasi',
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
                        TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                            label: const Text('Nominal'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          minLines: 2,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            label: const Text('Doa'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SizedBox(
                            height: 45,
                            width: MediaQuery.of(context).size.width - 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/success', (route) => false);
                              },
                              child: Text(
                                'Bayar',
                                style: buttonTextStyle.copyWith(
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
