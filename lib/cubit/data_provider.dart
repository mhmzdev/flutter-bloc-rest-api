part of 'country_cubit.dart';

class CountryDataProvider {
  static final dio = Dio();
  static const apiUrl = "https://coronavirus-19-api.herokuapp.com/countries";

  static Future<List<Country>> fetch() async {
    try {
      final response = await dio.get(apiUrl);

      List data = response.data;

      List<Country> countries = List.generate(
        data.length,
        (index) => Country.fromMap(
          data[index],
        ),
      );

      return countries;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
