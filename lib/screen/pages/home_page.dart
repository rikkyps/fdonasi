part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //HEADER
              Container(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.1,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Cari yang ingin kamu bantu..',
                          hintStyle: labelTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Icon(Icons.search_rounded),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),

              //SLIDERS
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    SliderCard(
                      image: 'assets/images/slider2.jpeg',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SliderCard(
                      image: 'assets/images/slider3.jpeg',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SliderCard(
                      image: 'assets/images/slider4.webp',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),

              //CATEGORIES
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryCard(
                      image: 'assets/images/baby.png',
                      title: 'Anak',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryCard(
                      image: 'assets/images/disaster.png',
                      title: 'Bencana',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryCard(
                      image: 'assets/images/mosque.png',
                      title: 'Rumah Ibadah',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryCard(
                      image: 'assets/images/more.png',
                      title: 'Lainnya',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/campaign-detail', (route) => false);
                      },
                      child: const CampaignCard(
                        name: 'Yayasal Al-Irsyadi',
                        image: 'assets/images/campaign1.jpeg',
                        time: '20 Hari',
                        percent: 80,
                        title: 'Donasi untuk rumah ibadah korban bencana alam',
                        target: 100000000,
                        terkumpul: 80000000,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const CampaignCard(
                      name: 'Yayasal Al-Irsyadi',
                      image: 'assets/images/campaign3.jpeg',
                      time: '20 Hari',
                      percent: 50,
                      title: 'Donasi untuk anak yatim',
                      target: 100000000,
                      terkumpul: 50000000,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const CampaignCard(
                      name: 'Yayasal Al-Irsyadi',
                      image: 'assets/images/campaign2.jpeg',
                      time: '20 Hari',
                      percent: 70,
                      title: 'Donasi untuk rumah korban bencana alam',
                      target: 100000000,
                      terkumpul: 70000000,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
