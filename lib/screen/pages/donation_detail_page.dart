part of 'pages.dart';

class DonationDetailPage extends StatelessWidget {
  const DonationDetailPage({Key? key, this.payment}) : super(key: key);
  final Payment? payment;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: ((context, state) {
        if (state is DonePayment) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(index: 2),
            ),
          );
          // Navigator.pop(context);
        }
      }),
      builder: (context, state) => Scaffold(
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
                          'Detail Donasiku',
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
                                image: NetworkImage(payment!.image!.toString()),
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
                                      payment!.maxDate.toString(),
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
                              payment!.title.toString(),
                              style: buttonTextStyle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: const Icon(Icons.money),
                              title: Text(
                                NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: 'Rp. ',
                                        decimalDigits: 0)
                                    .format(
                                  payment!.amount,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: const Text('Doa'),
                              title: Text(payment!.pray!),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: const Text('Status'),
                              title: Text(
                                payment!.status!,
                                style: buttonTextStyle.copyWith(
                                    color: (payment!.status! == 'success')
                                        ? successColor
                                        : (payment!.status! == 'pending')
                                            ? Colors.amber
                                            : Colors.red),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          (payment!.status == 'pending' ||
                                  payment!.status == 'failed')
                              ? SizedBox(
                                  height: 40,
                                  width:
                                      (MediaQuery.of(context).size.width) - 80,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.amber,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      // ignore: deprecated_member_use
                                      launch(
                                          'https://app.sandbox.midtrans.com/snap/v2/vtweb/${payment!.snapToken!}');
                                    },
                                    child: Text(
                                      'Donasi sekarang',
                                      style: buttonTextStyle.copyWith(
                                          color: Colors.black),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 10,
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
                                payment!.invoice ?? 'Yayasan Al-Irsyadi',
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
                            Bidi.stripHtmlIfNeeded(payment!.description!),
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
      ),
    );
  }
}
