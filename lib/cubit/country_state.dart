part of 'country_cubit.dart';

abstract class CountryState extends Equatable {
  final List<Country> data;
  final String message;

  const CountryState({
    this.data,
    this.message,
  });

  @override
  List<Object> get props => [
        data,
        message,
      ];
}

class CountryLoadingState extends CountryState {
  const CountryLoadingState() : super();
}

class CountrySuccessState extends CountryState {
  const CountrySuccessState({List<Country> data}) : super(data: data);
}

class CountryFailedState extends CountryState {
  const CountryFailedState({String message}) : super(message: message);
}
