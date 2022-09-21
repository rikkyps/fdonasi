part of 'pages.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MydonationCubit>().getMyDonation();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Donasiku',
            style: buttonTextStyle.copyWith(color: Colors.black, fontSize: 18),
          ),
        ),
        backgroundColor: Colors.amber.withOpacity(0.6),
      ),
      body: RefreshIndicator(
        onRefresh: () => context.read<MydonationCubit>().getMyDonation(),
        child: SafeArea(
          child: BlocConsumer<MydonationCubit, MydonationState>(
            listener: ((context, state) {}),
            builder: (context, state) => (state is MyDonationLoaded)
                ? ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.vertical,
                    children: state.donation
                        .map(
                          (e) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DonationDetailPage(
                                      payment: e,
                                    ),
                                  ),
                                );
                              },
                              child: DonationHistoryPage(donation: e)),
                        )
                        .toList())
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
      ),
    );
  }
}
