part of 'pages.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: ((context, state) async {
        if (state is UpdatePasswordDone) {
          _showLoginFailResult(context, 'Update Password Berhasil');
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
        } else if (state is UpdatePasswordFailed) {
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
                              'Update Password',
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
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _password,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: primaryColor,
                                ),
                                labelText: 'Password',
                                hintText: 'Password'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password harus diisi.';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _confirmation,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Icon(
                                  Icons.confirmation_number,
                                  color: primaryColor,
                                ),
                                labelText: 'Konfirmasi Password',
                                hintText: 'Konfimasi Password'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Konfirmasi Password harus diisi.';
                              } else if (value != _password.text) {
                                return 'Konfirmasi Password salah.';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          (state is OnUpdatePassword)
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
                                            .updatePassword(_password.text,
                                                _confirmation.text);
                                      } else {
                                        _showLoginFailResult(
                                            context, "Periksa kembali");
                                      }
                                    },
                                    child: Text(
                                      'Update Password',
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
