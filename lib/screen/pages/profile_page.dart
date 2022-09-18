part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().checkSession();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is Logout) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      },
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: (state is SessionLoaded)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                state.user.avatar ?? state.user.avatar!),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        state.user.name ?? state.user.name!,
                        style: buttonTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: accentColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        state.user.email ?? state.user.email!,
                        style: buttonTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: accentColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: accentColor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.person,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Akun',
                            style: buttonTextStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: accentColor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.lock_open,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Ubah Password',
                            style: buttonTextStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await context.read<UserCubit>().logout();
                        // final prefs = await SharedPreferences.getInstance();
                        // print(prefs.getString('storeToken'));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: accentColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.logout,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Logout',
                              style: buttonTextStyle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : (state is SessionUnLoaded)
                  ? Center(
                      child: SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text('Login'),
                        ),
                      ),
                    )
                  : Center(
                      child: SpinKitFadingCircle(
                      color: primaryColor,
                      size: 40,
                    )),
        ),
      ),
    );
  }
}
