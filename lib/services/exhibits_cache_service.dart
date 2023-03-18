import 'package:uran_company_test/models/exhibit.dart';

abstract class ExhibitsCacheService {
  Future<List<Exhibit>> all();

  Future<void> save(List<Exhibit> exhibits);

  Future<void> clear();
}