import 'package:carros/carro/carros_ListView.dart';
import 'package:carros/carro/carros_api.dart';
import 'package:carros/utils/prefs.dart';
import 'package:flutter/material.dart';

import '../drawer_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    Future<int> future = Prefs.getInt("tavIdx");
    future.then((int idx) {
      print("Tab Default > $idx");
      _tabController.index = idx;
    });

    _tabController.addListener(() {
      print("Tab ${_tabController.index}");

      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(
            text: "Clássicos",
          ),
          Tab(
            text: "Esportivos",
          ),
          Tab(
            text: "Luxo",
          ),
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CarrosListView(TipoCarro.classicos),
          CarrosListView(TipoCarro.esportivos),
          CarrosListView(TipoCarro.luxo),
        ],
      ),
      drawer: DrawerList(),
    );
  }
}
