import 'package:uran_company_test/models/exhibit.dart';
import 'package:uran_company_test/services/exhibits_cache_service.dart';
import 'package:uran_company_test/services/hive_cache.dart';

class ExhibitsCacheImpl extends HiveCache implements ExhibitsCacheService {
  @override
  final String name = 'exhibits';
  static const String _alExhibitsKey = 'all_exhibits';

  @override
  Future<List<Exhibit>> all() async {
    final storage = await cache();

    try {
      final json = storage.get(_alExhibitsKey) as List<dynamic>?;

      if (json == null) {
        return [];
      }


      return json.map<Exhibit>((e) {
        return Exhibit.fromJson(Map<String, dynamic>.from(e));
      }).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> save(List<Exhibit> exhibits) async {
    final storage = await cache();
    await clear();

    final exhibitsJson = exhibits.map((e) => e.toJson()).toList();

    await storage.put(_alExhibitsKey, exhibitsJson);
  }

  @override
  Future<void> clear() async {
    final storage = await cache();
    await storage.clear();
  }
}