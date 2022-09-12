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
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: RegisterPage(),
          onGenerateRoute: routerApp.onGenerateRouter),
    );
  }
}
