import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './routes/router_app.dart';
import 'cubit/cubit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final RouterApp routerApp = RouterApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => DonationCubit()),
        BlocProvider(create: (_) => CategoryCubit()),
        BlocProvider(create: (_) => SliderCubit()),
        BlocProvider(create: (_) => PaymentCubit()),
        BlocProvider(create: (_) => MydonationCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: RegisterPage(),
          onGenerateRoute: routerApp.onGenerateRouter),
    );
  }
}
