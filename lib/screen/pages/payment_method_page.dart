part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key, this.url}) : super(key: key);
  final String? url;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: ((context, state) {
        if (state is DonePayment) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      }),
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  'assets/images/success_icon.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Pilih Metode Pembayaran',
                style: jargonTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          // ignore: deprecated_member_use
                          launch(url!);
                          await context.read<PaymentCubit>().checkPayment();
                        },
                        child: Text(
                          'Bayar',
                          style: buttonTextStyle.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
