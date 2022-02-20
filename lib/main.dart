import 'package:bloc_app/cubit/country_cubit.dart';
import 'package:bloc_app/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // wrap whole App with BloCProviders
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CountryCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'COVID Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CountryScreen(),
      ),
    );
  }
}
