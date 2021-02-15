import 'package:flutter/material.dart';
import 'package:http_test/model/cat.dart';
import 'package:http_test/view/view_model.dart';
import 'package:http_test/widget/card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModel>.reactive(
      builder: (context, model, _) => Scaffold(
        body: Container(
          child: SmartRefresher(
            controller: model.refreshController,
            header: ClassicHeader(),
            enablePullUp: true,
            onRefresh: model.fetch,
            onLoading: model.fetch,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
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
    );
  }
}
