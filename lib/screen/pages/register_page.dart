part of 'pages.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _konfirmasi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: ((context, state) {
        if (state is SuccessRegister) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        } else if (state is FailedRegister) {
          _showLoginFailResult(context, state.message);
        }
      }),
      builder: (context, state) => Scaffold(
        body: ListView(
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
                'Daftar',
                style:
                    jargonTextStyle.copyWith(fontSize: 14, color: Colors.black),
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
                    controller: _name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: primaryColor,
                      ),
                      labelText: 'Nama Lengkap',
                      hintText: 'Nama lengkap',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        //Validasi untuk value kosong dan huruf selain a-z A-Z
                        return 'Tidak boleh kosong';
                      } else if (value.length < 3) {
                        return 'Minimal 3 karakter';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _email,
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
                      } else if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _konfirmasi,
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
                  (state is OnRegister)
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<UserCubit>().register(
                                    _name.text,
                                    _email.text,
                                    _password.text,
                                    _konfirmasi.text);
                              } else {
                                _showLoginFailResult(
                                    context, 'Mohon periksa kembali!');
                              }
                            },
                            child: Text(
                              'Register',
                              style: buttonTextStyle,
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style: buttonTextStyle.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: headerTextStyle.copyWith(
                              color: primaryColor,
                              fontSize: 14,
                              decoration: TextDecoration.underline),
                        ),
                      )
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
