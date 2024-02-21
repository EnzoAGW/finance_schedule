import 'package:flutter/material.dart';
import 'package:finance_schedule/GlobalVars.dart';

class CostHomeCard extends StatefulWidget {
  late String title;
  late String subTitle;
  late IconData icon;
  late String cost;
  late String date;

  CostHomeCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.cost,
      required this.date});

  @override
  State<CostHomeCard> createState() => CostHomeCardState();
}

class CostHomeCardState extends State<CostHomeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(13)),
      width: MediaQuery.of(context).size.width,
      height: 85,
      child: ListTile(
        isThreeLine: true,
        leading: Icon(widget.icon, color: Colors.white, size: 30),
        title: Text(widget.title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        subtitle:
            Text(widget.subTitle, style: const TextStyle(color: Colors.white)),
        trailing: Column(children: [
          Text('-\$ ${widget.cost}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text(widget.date, style: const TextStyle(color: Colors.white)),
        ]),
      ),
    );
  }
}
