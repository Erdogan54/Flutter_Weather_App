import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabaseSharedPref {
  final Future<SharedPreferences> prefsFuture = SharedPreferences.getInstance();
  late Future<List<String>> searchListFuture;

  Future<List<String>> getDataPref()  {
    return searchListFuture =
        prefsFuture.then((value) => value.getStringList("search") ?? []);
  }

  Future<List<String>> setListPref({required List<String> yeniList}) async {
    final SharedPreferences prefs = await prefsFuture;

    return searchListFuture =
        prefs.setStringList("search", yeniList).then((bool value) => yeniList);
  }
}
