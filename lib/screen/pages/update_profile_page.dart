part of 'pages.dart';

class UpdateProfilePage extends StatefulWidget {
  final User? user;

  const UpdateProfilePage({Key? key, this.user}) : super(key: key);

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  void initState() {
    _name.text = widget.user!.name!;
    _email.text = widget.user!.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: ((context, state) async {
        if (state is UpdateProfileDone) {
          _showLoginFailResult(context, 'Update Profile Berhasil');
          await Future.delayed(const Duration(seconds: 1));
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(
                index: 3,
              ),
            ),
          );
        } else if (state is UpdateProfileFailed) {
          setState(() {
            _showLoginFailResult(context, state.message);
          });
        }
      }),
      builder: ((context, state) => Scaffold(
            body: SafeArea(
              child: ListView(
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
                              'Update Akun',
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
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(widget.user!.avatar!),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _email,
                            enabled: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: primaryColor,
                                ),
                                labelText: 'Email',
                                hintText: 'Email'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: primaryColor,
                                ),
                                labelText: 'Name',
                                hintText: 'Name'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nama harus diisi';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          (state is OnUpdateProfile)
                              ? SpinKitFadingCircle(
                                  color: primaryColor,
                                  size: 35,
                                )
                              : SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await context
                                            .read<UserCubit>()
                                            .updateProfile(_name.text);
                                      } else {
                                        _showLoginFailResult(
                                            context, "Periksa kembali");
                                      }
                                    },
                                    child: Text(
                                      'Update Profile',
                                      style: buttonTextStyle,
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<Object?> _showLoginFailResult(BuildContext context, String message) {
    return showFlash(
      context: context,
      duration: const Duration(seconds: 1),
      builder: (context, controller) {
        return Flash.bar(
          borderRadius: BorderRadius.circular(8),
          margin: const EdgeInsets.all(8),
          controller: controller,
          backgroundGradient: const LinearGradient(
            colors: [Colors.amber, Colors.amber],
          ),
          position: FlashPosition.top,
          enableVerticalDrag: true,
          forwardAnimationCurve: Curves.easeOutBack,
          horizontalDismissDirection: HorizontalDismissDirection.startToEnd,
          child: FlashBar(
            content: Text(
              message,
              style:
                  jargonTextStyle.copyWith(fontSize: 14, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
