import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {



  void initPresenter();
  void disposePresenter();
  void initData();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disposePresenter();
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPresenter();
    initData();
  }


}
