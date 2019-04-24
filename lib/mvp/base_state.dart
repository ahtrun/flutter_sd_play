import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver{



  void initPresenter();
  void disposePresenter();
  void initData();


  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    disposePresenter();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.inactive){
      print("生命周期：inactive");
      inactive();
    }else if(state ==AppLifecycleState.paused){
      print("生命周期：paused");
      paused();
    }else if(state == AppLifecycleState.resumed){
      print("生命周期：resumed");
      resumed();
    }else if(state == AppLifecycleState.suspending){
      print("生命周期：suspending");
      suspending();
    }

  }

  void inactive(){

  }
  void paused(){

  }
  void resumed(){

  }
  void suspending(){

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPresenter();
    WidgetsBinding.instance.addObserver(this);
    initData();
  }

}
