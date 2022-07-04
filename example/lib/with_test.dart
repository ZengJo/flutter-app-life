import 'package:app_life/life_manage.dart';
import 'package:app_life/life_manage_call.dart';
import 'package:flutter/material.dart';

class WithTestPage extends StatefulWidget {
  const WithTestPage({Key? key}) : super(key: key);

  @override
  _WithTestPageState createState() => _WithTestPageState();
}

class _WithTestPageState extends State<WithTestPage> with LifeManageCall {
  @override
  void initState() {
    super.initState();
    LifeManage.instance!.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WithTest'),
        ),
        body: Center(
          child: Column(),
        ));
  }

  @override
  void onCreate() {
    print("onCreate=============");
  }

  @override
  void onRestart() {
    print("onRestart=============");
  }

  @override
  void applicationDidBecomeActive() {
    print("applicationDidBecomeActive=============");
  }

  @override
  void applicationDidEnterBackground() {
    print("applicationDidEnterBackground=============");
  }
}
