import 'package:http_test/api/catapi.dart';
import 'package:http_test/model/cat.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

class ViewModel extends BaseViewModel {
  ViewModel();
  List<Cat> cats;
  RefreshController refreshController = RefreshController(
      initialRefresh: false, initialRefreshStatus: RefreshStatus.refreshing);

  Future<List<Cat>> getCats() async {
    final result = await CatApi.getCatsList();
    if (result != null) {
      return Cat.listFromJson(result);
    } else
      return null;
  }

  Future<void> fetch() async {
    setBusy(true);
    cats = await getCats();
    refreshController.refreshCompleted();
    setBusy(false);
  }
}
