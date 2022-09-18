// ignore_for_file: use_build_context_synchronously

part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: ((context, state) {
        if (state is LoginSuccess) {
          Navigator.pop(context);
        } else if (state is LoginFailed) {
          setState(() {
            _showLoginFailResult(context, state.message);
          });
        }
      }),
      builder: ((context, state) => Scaffold(
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(
                    height: 60,
                  ),
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
                  Center(
                    child: Text(
                      'Al-Irsaydi Peduli',
                      style: jargonTextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Text(
                      'Masuk',
                      style: jargonTextStyle.copyWith(
                          fontSize: 14, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: Icon(
                                Icons.mail,
                                color: primaryColor,
                              ),
                              labelText: 'Email',
                              hintText: 'Email'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              //Validasi untuk value kosong dan huruf selain a-z A-Z
                              return 'Tidak boleh kosong';
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
                                .hasMatch(value)) {
                              return 'Format tidak sesuai';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: password,
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
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Lupa password?',
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 10,
                                    color: const Color(0xff87ADF4)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        (state is OnLogin)
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
                                          .login(email.text, password.text);
                                    } else {
                                      _showLoginFailResult(
                                          context, "Periksa kembali");
                                    }
                                  },
                                  child: Text(
                                    'Login',
                                    style: buttonTextStyle,
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah punya akun?',
                              style:
                                  buttonTextStyle.copyWith(color: accentColor),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/register', (route) => false);
                              },
                              child: Text(
                                'Register',
                                style: headerTextStyle.copyWith(
                                    color: primaryColor,
                                    fontSize: 14,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
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
