part of 'pages.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: const DonationHistoryPage(
                title: 'Sedekah pembangunan masjid korban bencana',
                image: 'assets/images/campaign1.jpeg',
                date: '16 Agustus 2022',
                nominal: '2.500.000',
                status: 'Success',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: const DonationHistoryPage(
                title: 'Sedekah rumah korban bencana',
                image: 'assets/images/campaign2.jpeg',
                date: '17 Agustus 2022',
                nominal: '2.000.000',
                status: 'Success',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const DonationHistoryPage(
                title: 'Sedekah pakaian untuk anak-anak',
                image: 'assets/images/campaign3.jpeg',
                date: '18 Agustus 2022',
                nominal: '3.000.000',
                status: 'Success',
              ),
            )
          ],
        ),
      ),
    );
  }
}
