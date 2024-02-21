import 'package:finance_schedule/DataSets.dart';
import 'package:finance_schedule/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:finance_schedule/GlobalVars.dart';

class CostDetails extends StatefulWidget {
  const CostDetails({super.key});

  @override
  State<CostDetails> createState() => CostDetailsState();
}

class CostDetailsState extends State<CostDetails> {
  var datas = DataSets();
  var db;
  var repeat;
  @override
  void initState() {
    db = datas.id;
    super.initState();
    repeat = [db['repeat']['active'], db['repeat']['frequency']];
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(db['name']),
        ),
        body: SizedBox(
            height: screen.height,
            width: screen.width,
            child: FutureBuilder(
                future: null,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (db != null) {
                    return Column(
                      children: [
                        Image.asset(db['img-url'], width: 100),
                        SizedBox(
                            height: screen.height - 300,
                            width: screen.width,
                            child: ListTile(
                                title: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: const Text(
                                      'Billing',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )),
                                subtitle: SingleChildScrollView(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(13)),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 85,
                                          child: ListTile(
                                            leading: const Text('First payment',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                            trailing: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Text(db['first-payment'],
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        // fontWeight: FontWeight.bold,
                                                        color: Colors.white))),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(13)),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 150,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ListTile(
                                                  title: const Text('Repeat',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white)),
                                                  subtitle: Text(
                                                    'set a cycle for your plan',
                                                    style: TextStyle(
                                                        color: const Color
                                                            .fromARGB(255, 178,
                                                            175, 175)),
                                                  ),
                                                  trailing: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5),
                                                      child: Switch(
                                                        activeColor:
                                                            Colors.white,
                                                        activeTrackColor:
                                                            Colors.greenAccent,
                                                        onChanged: (e) =>
                                                            setState(() =>
                                                                repeat[0] = e),
                                                        value: repeat[0],
                                                      )),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    OutlinedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          repeat[1] = 'WEEKLY';
                                                        });
                                                      },
                                                      child: Text('WEEK'),
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        elevation: repeat[1] == 'WEEKLY'? 1 : 0,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 30),
                                                        foregroundColor:
                                                            Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  16), // <-- Radius
                                                        ),
                                                      ),
                                                    ),
                                                    OutlinedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          repeat[1] = 'MONTHLY';
                                                        });
                                                      },
                                                      child: Text('MONTH'),
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        elevation: repeat[1] == 'MONTHLY'? 1 : 0,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 30),
                                                        foregroundColor:
                                                            Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  16), // <-- Radius
                                                        ),
                                                      ),
                                                    ),
                                                    OutlinedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          repeat[1] = 'YEARLY';
                                                        });
                                                      },
                                                      child: Text('YEAR'),
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        elevation: repeat[1] == 'YEARLY'? 1 : 0,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 30),
                                                        foregroundColor:
                                                            Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  16), // <-- Radius
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(13)),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 85,
                                          child: ListTile(
                                            title: const Text('Payment method',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                            subtitle: Text(
                                              'select another method',
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 178, 175, 175)),
                                            ),
                                            trailing: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Text(
                                                    db['payment-method'],
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        // fontWeight: FontWeight.bold,
                                                        color: Colors.white))),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: SizedBox(
                                                width: screen.width - 70,
                                                height: 50,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute<void>(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              const Home(),
                                                        ));
                                                  },
                                                  child: Text('Confirm'),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.green,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12), // <-- Radius
                                                    ),
                                                  ),
                                                )))
                                      ]),
                                )))
                      ],
                    );
                  } else {
                    return CircularProgressIndicator.adaptive();
                  }
                })));
  }
}
