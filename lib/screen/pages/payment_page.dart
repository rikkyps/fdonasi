part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key, this.donation}) : super(key: key);
  final Donation? donation;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _amount = TextEditingController();

  final TextEditingController _doa = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: ((context, state) {
        if (state is SuccessPayment) {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentMethodPage(
                  url: state.link,
                ),
              ),
            );
          });
        } else if (state is FailedPayment) {
          _showLoginFailResult(context, state.message);
        }
      }),
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
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
                          'Pembayaran Donasi',
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
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.83,
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Program Donasi',
                              style: buttonTextStyle.copyWith(
                                color: accentColor,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              height: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5 -
                                          15,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(widget.donation!.image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                            0.5 -
                                        15,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5 -
                                          15,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          widget.donation!.title!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: buttonTextStyle.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          widget.donation!.name!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: buttonTextStyle.copyWith(
                                              color: accentColor,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12),
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          widget.donation!.maxDate!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: buttonTextStyle.copyWith(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Nominal Donasi',
                              style: buttonTextStyle.copyWith(
                                color: accentColor,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              height: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _amount,
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                label: const Text('Nominal'),
                                hintText: 'Minimal 10.000 Rupiah',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  //Validasi untuk value kosong dan huruf selain a-z A-Z
                                  return 'Tidak boleh kosong';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _doa,
                              minLines: 2,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                label: const Text('Doa'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  //Validasi untuk value kosong dan huruf selain a-z A-Z
                                  return 'Tidak boleh kosong';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            (state is OnPayment)
                                ? const SpinKitFadingCircle(
                                    color: Colors.amber,
                                    size: 35,
                                  )
                                : Center(
                                    child: SizedBox(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.amber,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            await context
                                                .read<PaymentCubit>()
                                                .payment(widget.donation!.slug!,
                                                    _amount.text, _doa.text);
                                          } else {
                                            _showLoginFailResult(context,
                                                'Mohon periksa kembali!');
                                          }
                                          // Navigator.pushNamedAndRemoveUntil(
                                          //     context, '/success', (route) => false);
                                        },
                                        child: Text(
                                          'Bayar',
                                          style: buttonTextStyle.copyWith(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
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
