// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print, unnecessary_const

import 'package:flutter/material.dart';
import 'package:horoscope_reviews/burc_item.dart';
import 'package:horoscope_reviews/data/strings.dart';
import 'package:horoscope_reviews/models/horoscope.dart';

class BurcListesi extends StatelessWidget {
  late List<Horoscope> allHoroscopes = [];

  BurcListesi() {
    allHoroscopes = readyForDataBase();
    print(allHoroscopes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red.shade900,
            centerTitle: true,
            title: const Text(
              "Burç Listesi",
            ),
            elevation: 10.0,
            shape: const ContinuousRectangleBorder(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(99),
                    bottomRight: Radius.circular(99)))),
        body: Center(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return BurcItem(
              listelenenBurc: allHoroscopes[index],
            );
          },
          itemCount: allHoroscopes.length,
        )));
  }

  List<Horoscope> readyForDataBase() {
    List<Horoscope> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";
      Horoscope addHoroscope = Horoscope(
          burcAdi, burcTarih, burcDetay, burcKucukResim, burcBuyukResim);
      gecici.add(addHoroscope);
    }
    return gecici;
  }
}
