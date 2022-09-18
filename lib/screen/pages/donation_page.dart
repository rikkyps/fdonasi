part of 'pages.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MydonationCubit>().getMyDonation();
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MydonationCubit, MydonationState>(
          listener: ((context, state) {}),
          builder: (context, state) => (state is MyDonationLoaded)
              ? ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.vertical,
                  children: state.donation
                      .map(
                        (e) => DonationHistoryPage(donation: e),
                      )
                      .toList()
                  // [
                  //   const SizedBox(
                  //     height: 20,
                  //   ),
                  //   Container(
                  //     margin: const EdgeInsets.only(bottom: 15),
                  //     height: 150,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration:
                  //         BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  //     child: const DonationHistoryPage(
                  //       title: 'Sedekah pembangunan masjid korban bencana',
                  //       image: 'assets/images/campaign1.jpeg',
                  //       date: '16 Agustus 2022',
                  //       nominal: '2.500.000',
                  //       status: 'Success',
                  //     ),
                  //   ),
                  //   Container(
                  //     margin: const EdgeInsets.only(bottom: 15),
                  //     height: 150,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration:
                  //         BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  //     child: const DonationHistoryPage(
                  //       title: 'Sedekah rumah korban bencana',
                  //       image: 'assets/images/campaign2.jpeg',
                  //       date: '17 Agustus 2022',
                  //       nominal: '2.000.000',
                  //       status: 'Success',
                  //     ),
                  //   ),
                  //   Container(
                  //     margin: const EdgeInsets.only(bottom: 15),
                  //     height: 150,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     child: const DonationHistoryPage(
                  //       title: 'Sedekah pakaian untuk anak-anak',
                  //       image: 'assets/images/campaign3.jpeg',
                  //       date: '18 Agustus 2022',
                  //       nominal: '3.000.000',
                  //       status: 'Success',
                  //     ),
                  //   )
                  // ],

                  )
              : (state is LoadMyDonation)
                  ? Center(
                      child: SpinKitFadingCircle(
                      size: 40,
                      color: primaryColor,
                    ))
                  : (state is MyDonationUnLoaded)
                      ? Center(
                          child: Text(
                          'Tidak ada transaksi donasi',
                          style: buttonTextStyle.copyWith(
                              color: Colors.black, fontSize: 12),
                        ))
                      : Center(
                          child: SpinKitFadingCircle(
                            size: 40,
                            color: primaryColor,
                          ),
                        ),
        ),
      ),
    );
  }
}
