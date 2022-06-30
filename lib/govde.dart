
import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/screens/business.dart';

import 'package:haber_uygulamasi/screens/genel_haber.dart';
import 'package:haber_uygulamasi/screens/science.dart';

import 'package:haber_uygulamasi/screens/spor.dart';
import 'package:haber_uygulamasi/screens/teknoloji.dart';




class Govde extends StatefulWidget {
  const Govde({Key? key}) : super(key: key);

  @override
  State<Govde> createState() => _GovdeState();
}

class _GovdeState extends State<Govde> with SingleTickerProviderStateMixin{
  late  TabController _tabController;
  @override
  void initState() {
      _tabController = TabController(length: 5, initialIndex: 0, vsync: this);
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: const Text("Haber Uygulaması",style: TextStyle(fontSize: 25,color: Colors.black),),
           bottom: TabBar(
         isScrollable: true,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            controller: _tabController,
            indicatorColor: Colors.red,
            tabs: const <Widget>[
           Tab(
                text: "Genel",
              ),
              Tab(
                text: "Spor",
              ),
              Tab(
                text: "İş",
              ),
              Tab(
                text: "Bilim",
              ),
              Tab(
                text: "Teknoloji",
              ),
              
            ],
          ),
        ),
          body: TabBarView(
          controller: _tabController,
          children:  const <Widget>[
            GenelHaberSayfa(),
         SporHaberSayfa(),
         BusinessHaberSayfa(),
         ScienceHaberSayfa(),
         TeknolojiHaberSayfa()
         
          ],
        ),),
    );
  }

  
}
