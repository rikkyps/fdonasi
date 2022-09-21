part of 'pages.dart';

class CampaignPage extends StatelessWidget {
  CampaignPage({Key? key}) : super(key: key);
  final TextEditingController _keyword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<CategoryCubit>().getCategory();
    context.read<DonationCubit>().getCampaign();

    Future<void> search(String value) async {
      if (value.isEmpty) {
        await context.read<DonationCubit>().getCampaign();
      } else {
        await context.read<DonationCubit>().getCampaign(keyword: value);
      }
    }

    return BlocConsumer<DonationCubit, DonationState>(
      listener: (context, state) => {},
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                          controller: _keyword,
                          onChanged: (value) => search(value),
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

                //CATEGORIES
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width,
                  child: BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) => ListView(
                        scrollDirection: Axis.horizontal,
                        children: (state is CategoryLoaded)
                            ? state.category
                                .map(
                                  (e) => Padding(
                                    padding: EdgeInsets.only(
                                        left: (e == state.category.first)
                                            ? 10
                                            : 0,
                                        right: (e == state.category.last)
                                            ? 10
                                            : 5),
                                    child: CategoryCard(category: e),
                                  ),
                                )
                                .toList()
                            : dummyItem
                                .map(
                                  (e) => Padding(
                                    padding: EdgeInsets.only(
                                        left: (e == dummyItem.first) ? 10 : 0,
                                        right: (e == dummyItem.last) ? 10 : 5),
                                    child: const ShimmerCategory(),
                                  ),
                                )
                                .toList()),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  child: (state is LoadDonation)
                      ? ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          children: dummyItem
                              .map(
                                (e) => Padding(
                                  padding: EdgeInsets.only(
                                      top: (e == dummyItem.first) ? 10 : 0,
                                      bottom: (e == dummyItem.last) ? 30 : 5),
                                  child: const ShimmerCampaign(),
                                ),
                              )
                              .toList(),
                        )
                      : (state is DoantionLoaded)
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
                          : (state is SearchLoaded)
                              ? GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CampaginDetailPage(
                                        donation: state.donation,
                                      ),
                                    ),
                                  ),
                                  child: CampaignCard(
                                    donation: state.donation,
                                  ),
                                )
                              : (state is SearchNotFound)
                                  ? Center(
                                      child: Text(
                                        state.message,
                                        style: buttonTextStyle.copyWith(
                                            color: Colors.black),
                                      ),
                                    )
                                  : (state is DonationUnLoaded)
                                      ? Center(
                                          child: Text(
                                            state.message,
                                            style: buttonTextStyle.copyWith(
                                                color: Colors.black),
                                          ),
                                        )
                                      : SpinKitFadingCircle(
                                          color: primaryColor,
                                          size: 40,
                                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
