import 'package:flutter/material.dart';

class PaymentTypeWidget extends StatefulWidget {
  IconData icon;
  String paymentType;
  bool selected;
  final VoidCallback? selection;
  PaymentTypeWidget(
      {super.key,
      required this.icon,
      required this.selected,
      required this.paymentType,
      this.selection});

  @override
  State<PaymentTypeWidget> createState() => _PaymentTypeWidgetState();
}

class _PaymentTypeWidgetState extends State<PaymentTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: GestureDetector(
            onTap: widget.selection,
            child: Container(
                width: 130,
                child: Card(
                  color: widget.selected != true
                      ? Colors.white
                      : Color.fromARGB(255, 84, 79, 79),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Color.fromARGB(255, 179, 161, 0))),
                  child: Center(
                      child: ListTile(
                          title: Icon(widget.icon,
                              size: 50,
                              color: widget.selected != true
                                  ? Colors.grey
                                  : Colors.white),
                          subtitle: Text(
                            widget.paymentType,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: widget.selected != true
                                    ? Colors.grey
                                    : Colors.white),
                          ),
                          titleAlignment: ListTileTitleAlignment.center)),
                ))));
  }
}
