import 'package:bloc_app/cubit/country_cubit.dart';
import 'package:bloc_app/widgets/record_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  void initState() {
    final countryCubit = BlocProvider.of<CountryCubit>(context);
    countryCubit.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello COVID!'),
      ),
      body: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) {
          // loading
          if (state is CountryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // success
          else if (state is CountrySuccessState) {
            return ListView(
              children: state.data
                  .map(
                    (country) => RecordCard(
                      country: country,
                    ),
                  )
                  .toList(),
            );
          }

          // failure
          else if (state is CountryFailedState) {
            return Center(
              child: Text(state.message),
            );
          }

          // return
          return const Center(
            child: Text('Something went wrong'),
          );
        },
      ),
    );
  }
}
