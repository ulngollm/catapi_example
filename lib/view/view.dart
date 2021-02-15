import 'package:flutter/material.dart';
import 'package:http_test/view/view_model.dart';
import 'package:http_test/widget/card.dart';
import 'package:http_test/widget/catcard.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModel>.reactive(
      builder: (context, model, _) => Scaffold(
        body: model.isBusy
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SmartRefresher(
                    controller: model.refreshController,
                    header: ClassicHeader(),
                    onRefresh: model.fetch,
                    child: ListView(
                      children: List.generate(model.cats?.length ?? 0,
                          (index) => CatCard.fromObject(model.cats[index])),
                    ),
                  ),
                ),
              ),
      ),
      viewModelBuilder: () {
        return ViewModel();
      },
      onModelReady: (model) {
        print(model.isBusy);
        model.fetch();
      },
    );
  }
}
