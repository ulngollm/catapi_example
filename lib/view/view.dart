import 'package:flutter/material.dart';
import 'package:http_test/model/cat.dart';
import 'package:http_test/view/view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class View extends StatefulWidget {
  @override
  ViewState createState() => ViewState();
}

class ViewState extends State<View> {
  ViewModel _viewModel;
  List<Cat> catList;
  List<Widget> _elements;

  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    _viewModel = ViewModel(setState);
    final res = _viewModel.getWidgetList();
    res.then((value) => _elements = value);
  }

  void _onRefresh() async {
    print('refresh');
    _elements = await _viewModel.getWidgetList();
    _refreshController.refreshCompleted();
    setState(() {});
  }

  void _onLoading() async {
    _elements = await _viewModel.getWidgetList();
    print('loading');
    setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SmartRefresher(
        controller: _refreshController,
        header: ClassicHeader(),
        // enablePullUp: true,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            children: _elements,
          ),
        ),
      )),
    );
  }
}
