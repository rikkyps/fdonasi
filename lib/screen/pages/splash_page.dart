part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  // ignore: must_call_super
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<SliderCubit>().getSlider();
    context.read<CategoryCubit>().getCategory();
    context.read<DonationCubit>().getCampaign();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 210,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            'Al-Isyadi Peduli',
            style: jargonTextStyle,
          ),
          const SizedBox(
            height: 30,
          ),
          SpinKitFoldingCube(
            size: 30,
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
