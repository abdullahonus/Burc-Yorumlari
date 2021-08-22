// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:horoscope_reviews/models/horoscope.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Horoscope secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarColor = Colors.black45;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    findAppbarColor();
  //  WidgetsBinding.instance!.addPostFrameCallback((_) => findAppbarColor());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          backgroundColor: appBarColor,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              widget.secilenBurc.horoscopeName + " Burcu ve Özellikleri",
              style: TextStyle(backgroundColor: Colors.black26, fontSize: 17),
            ),
            background: Image.asset(
              "images/" + widget.secilenBurc.horoscopeBigImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Text(
                  "\t~Genel Özelikleri~\n",
                  style: TextStyle(fontSize: 20, color: Colors.red.shade100),
                ),
                Text(
                  widget.secilenBurc.horoscopeDetails,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            )),
          ),
        )
      ],
    ));
  }

  void findAppbarColor() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("images/${widget.secilenBurc.horoscopeBigImage}"));
    appBarColor = _generator.dominantColor!.color;
    setState(() {});
    print(appBarColor);
  }
}
