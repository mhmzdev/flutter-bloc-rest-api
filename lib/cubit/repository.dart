part of 'country_cubit.dart';

class CountryRepository {
  Future<List<Country>> fetch() => CountryDataProvider.fetch();
}
