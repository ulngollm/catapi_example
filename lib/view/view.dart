import 'package:flutter/material.dart';
import 'package:http_test/model/cat.dart';
import 'package:http_test/view/view_model.dart';
import 'package:http_test/widget/card.dart';


class View extends StatefulWidget {
  @override
  ViewState createState() => ViewState();
}

class ViewState extends State<View> {
  ViewModel _viewModel;
  List<Cat> catList;
  List<Widget> _elements;
  Function setList() {}

  @override
  void initState() {
    _viewModel = ViewModel(setState);
    final res = _viewModel.getWidgetList();
    res.then((value) => _elements = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _viewModel.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: _elements,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () async {
          print('presetState');
          _elements = await _viewModel.getWidgetList();
          
        },
      ),
    );
  }
}
