import 'package:dio/dio.dart';
import 'package:uran_company_test/models/exhibit.dart';
import 'package:uran_company_test/services/exhibits_loader.dart';

class RestExhibitsLoader implements ExhibitsLoader {
  final Dio _dio = Dio();
  final String _url =
      "https://my-json-server.typicode.com/Reyst/exhibit_db/list";

  @override
  Future<List<Exhibit>> getExhibitList() async {
    final Response response = await _dio.get(_url);
    final List<dynamic> jsonList = response.data as List<dynamic>;
    return jsonList
        .map((dynamic e) => Exhibit.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
