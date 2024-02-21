import 'package:finance_schedule/DataSets.dart';
import 'package:finance_schedule/GlobalVars.dart';
import 'package:finance_schedule/screens/Home.dart';
import 'package:finance_schedule/screens/controllers/requests.dart';
import 'package:finance_schedule/screens/widgets/DefaultInput.dart';
import 'package:finance_schedule/screens/widgets/decidoNomeDps.dart';
import 'package:flutter/material.dart';

class NewCostForm extends StatefulWidget {
  const NewCostForm({super.key});

  @override
  State<NewCostForm> createState() => _NewCostFormState();
}

class _NewCostFormState extends State<NewCostForm> {
  var datas = DataSets();

  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  TextEditingController cost = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController payment = TextEditingController();
  // final ReqsController reqs = ReqsController();
  var db;
  int selectedIndex = 0;

  selectType(idx, value) async {
    setState(
      () => {selectedIndex = idx, payment.text = value},
    );
  }

  @override
  void initState() {
    db = datas.paymenTypes.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          height: screen.height,
          width: screen.width,
          child: Form(
              child: ListView(shrinkWrap: true, children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Image.asset(
                './assets/logo.png',
                scale: 5,
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              DefaultInput(
                controller: title,
                labelText: 'Expense name',
              ),
              DefaultInput(
                controller: subtitle,
                labelText: 'Description',
              ),
              DefaultInput(
                controller: cost,
                labelText: 'Cost',
              ),
              DefaultInput(
                controller: date,
                labelText: 'Date to pay',
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: FutureBuilder(
                          future: null,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (db != null) {
                              return Row(children: [
                                SizedBox(
                                    height: 150,
                                    width: screen.width,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: db.length,
                                        itemBuilder: (context, idx) {
                                          return PaymentTypeWidget(
                                              icon: Icons.payments,
                                              selected: selectedIndex == idx
                                                  ? true
                                                  : false,
                                              paymentType: db[idx]['name'],
                                              selection: () => selectType(
                                                  idx, db[idx]['value']));
                                        }))
                              ]);
                            } else {
                              return const CircularProgressIndicator.adaptive();
                            }
                          }))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                      width: screen.width - 70,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => const Home(),
                              )); 
                        },
                        child: Text('Create new cost'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 179, 161, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      )))
            ]) //column-end
            ,
          ]) //column-end
              ),
        ));
  }
}
