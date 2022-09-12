part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentPage,
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 0) {
              currentPage = const HomePage();
            } else if (_currentIndex == 1) {
              currentPage = const DonationPage();
            } else if (_currentIndex == 2) {
              currentPage = const CampaignPage();
            } else if (_currentIndex == 3) {
              currentPage = const ProfilePage();
            }
          });
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: primaryColor,
            unselectedColor: accentColor,
          ),

          //Add Expense
          SalomonBottomBarItem(
            icon: const Icon(Icons.monitor_heart),
            title: const Text("Donasiku"),
            selectedColor: primaryColor,
            unselectedColor: accentColor,
          ),

          //Projects
          SalomonBottomBarItem(
            icon: const Icon(Icons.flag),
            title: const Text("Campaign"),
            selectedColor: primaryColor,
            unselectedColor: accentColor,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Akun"),
            selectedColor: primaryColor,
            unselectedColor: accentColor,
          ),
        ],
      ),
    );
  }
}
