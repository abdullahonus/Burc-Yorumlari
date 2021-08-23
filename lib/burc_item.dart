import 'package:flutter/material.dart';
import 'package:horoscope_reviews/burc_detay.dart';
import 'package:horoscope_reviews/models/horoscope.dart';

class BurcItem extends StatelessWidget {
  final Horoscope listelenenBurc;
  const BurcItem({required this.listelenenBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shadowColor: Colors.red.shade500,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BurcDetay(secilenBurc: listelenenBurc),
                ),
              );
            },
            leading: Image.asset(
              "images/" + listelenenBurc.horoscopeSmallImage,
              fit: BoxFit.cover,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
            ),
            title: Text(
              listelenenBurc.horoscopeName,
              style: myTextStyle
                  .headline6 /*  const TextStyle(fontSize: 20, fontWeight: FontWeight.w900) */,
            ),
            subtitle: Text(listelenenBurc.horoscopeDate),
          ),
        ),
      ),
    );
  }
}
