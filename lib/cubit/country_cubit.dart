import 'package:bloc/bloc.dart';
import 'package:bloc_app/model/country.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'country_state.dart';
part 'repository.dart';
part 'data_provider.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(const CountryLoadingState());

  final repo = CountryRepository();

  // fetch
  Future<void> fetch() async {
    emit(const CountryLoadingState());

    try {
      final countries = await repo.fetch();

      emit(CountrySuccessState(
        data: countries,
      ));
    } catch (e) {
      emit(CountryFailedState(
        message: e.toString(),
      ));
    }
  }
}
