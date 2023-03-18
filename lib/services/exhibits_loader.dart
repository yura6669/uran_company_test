import 'package:uran_company_test/models/exhibit.dart';

abstract class ExhibitsLoader {
  Future<List<Exhibit>> getExhibitList();
}
