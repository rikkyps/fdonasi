part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Future<void> data() async {
      context.read<SliderCubit>().getSlider();
      context.read<CategoryCubit>().getCategory();
      context.read<DonationCubit>().getCampaign();
    }

    return BlocBuilder<DonationCubit, DonationState>(
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.grey[200],
        body: RefreshIndicator(
          onRefresh: data,
          child: SingleChildScrollView(
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainPage(
                                    index: 2,
                                  ),
                                ),
                              );
                            },
                            child: Center(
                                child: Text(
                              'Cari yang ingin kamu bantu...',
                              style:
                                  buttonTextStyle.copyWith(color: Colors.black),
                              textAlign: TextAlign.left,
                            )),
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
                    child: BlocBuilder<SliderCubit, SliderState>(
                      builder: (context, state) => (state is SliderLoaded)
                          ? ListView(
                              scrollDirection: Axis.horizontal,
                              children: state.slider
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            left: (e == state.slider.first)
                                                ? 10
                                                : 0,
                                            right: (e == state.slider.last)
                                                ? 10
                                                : 5),
                                        child: SliderCard(
                                          slider: e,
                                        ),
                                      ))
                                  .toList(),
                            )
                          : SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: dummyItem.length,
                                itemBuilder: (_, index) => Container(
                                    margin: EdgeInsets.only(
                                        left: (index == 0) ? 10 : 0,
                                        right: (index == dummyItem.length - 1)
                                            ? 15
                                            : 10),
                                    child: const ShimmerSlider()),
                              ),
                            ),
                    ),
                  ),

                  //CATEGORIES
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width,
                    child: BlocBuilder<CategoryCubit, CategoryState>(
                      builder: (contex, state) => (state is CategoryLoaded)
                          ? ListView(
                              scrollDirection: Axis.horizontal,
                              children: (state.category
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            left: (e == state.category.first)
                                                ? 10
                                                : 0,
                                            right: (e == state.category.last)
                                                ? 10
                                                : 5),
                                        child: CategoryCard(
                                          category: e,
                                        ),
                                      ))
                                  .toList()),
                            )
                          : const ShimmerCategory(),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: BlocConsumer<DonationCubit, DonationState>(
                      listener: (context, state) async {
                        if (state is SearchLoaded ||
                            state is SearchNotFound ||
                            state is DonationUnLoaded ||
                            state is LoadDonation) {
                          await context.read<DonationCubit>().getCampaign();
                        }
                      },
                      builder: (context, state) => (state is DoantionLoaded)
                          ? ListView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              children: state.donation
                                  .map((e) => GestureDetector(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CampaginDetailPage(
                                              donation: e,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: (e == state.donation.first)
                                                  ? 10
                                                  : 0,
                                              bottom: (e == state.donation.last)
                                                  ? 30
                                                  : 5),
                                          child: CampaignCard(
                                            donation: e,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          : const ShimmerCampaign(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
