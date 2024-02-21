import 'package:finance_schedule/DataSets.dart';
import 'package:finance_schedule/screens/Details.dart';
import 'package:finance_schedule/screens/NewCost.dart';
import 'package:finance_schedule/screens/widgets/CostHomeCard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:finance_schedule/GlobalVars.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var datas = DataSets();
  var monthCost;
  int selectedIndex = 0;
  var monthExpensess;

  searchInfos(int? infosIndex) {
    var now = DateTime.now();
    var current_mon = now.month;

    if (infosIndex != null) {
      datas.mensalExpenses['2024']![selectedIndex];
      setState(() {
        monthExpensess = datas.mensalExpenses['2024']![selectedIndex];
        monthCost =
            datas.mensalExpenses['2024']![selectedIndex]['totalExpended'];
      });
    } else {
      datas.mensalExpenses['2024']!.map((e) {
        var index = datas.mensalExpenses['2024']!.indexOf(e);
        setState(() {
          if (index == current_mon - 1) {
            monthExpensess = e;
            monthCost = e['totalExpended'];
            selectedIndex = index;
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    searchInfos(null);
    monthCost;
    selectedIndex;
    monthExpensess;
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => NewCostForm(),
              ),
            );
          },
          backgroundColor: Colors.black87,
          child: Text(
            '+',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        backgroundColor: backgroundColor,
        body: FutureBuilder(
            future: searchInfos(0),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Column(children: [
                Padding(
                    padding: EdgeInsets.only(top: screen.height / 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder(
                                future: null,
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (monthCost != null) {
                                    return Text(
                                      '\$$monthCost',
                                      style: TextStyle(
                                          fontSize: 50, color: Colors.white),
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                }),
                            const Text(
                              'Your Spendings',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: null,
                            child: Text(
                              '2024',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    )),
                SizedBox(
                    width: screen.width,
                    height: screen.height / 4,
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: BarChart(
                          BarChartData(
                            barTouchData: barTouchData,
                            titlesData: titlesData,
                            borderData: FlBorderData(show: false),
                            barGroups: datas.mensalExpenses['2024']!.map((e) {
                              var index =
                                  datas.mensalExpenses['2024']!.indexOf(e);
                              return BarChartGroupData(
                                x: index,
                                barRods: [
                                  BarChartRodData(
                                    toY: double.parse(
                                        e['totalExpended'].toString()),
                                    width: 30,
                                    gradient: selectedIndex == index
                                        ? selectedGradient
                                        : barsGradient,
                                  )
                                ],
                              );
                            }).toList(),
                            gridData: const FlGridData(show: false),
                            alignment: BarChartAlignment.spaceAround,
                          ),
                        ))),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(top: 30, left: 20, bottom: 5),
                        child: Text('History',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))),
                SizedBox(
                    height: screen.height / 2.8,
                    width: screen.width - 40,
                    child: FutureBuilder(
                        future: null,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (monthExpensess != null) {
                            return ListView.builder(
                                itemCount: monthExpensess['costs'].length,
                                itemBuilder: (context, i) {
                                  return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: GestureDetector(
                                          onTap: () => {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            CostDetails()))
                                              },
                                          child: CostHomeCard(
                                              title: monthExpensess['costs'][i]
                                                      ['title']
                                                  .toString(),
                                              subTitle: monthExpensess['costs']
                                                      [i]['subtitle']
                                                  .toString(),
                                              icon: Icons.wysiwyg_outlined,
                                              cost: monthExpensess['costs'][i]
                                                      ['cost']
                                                  .toString(),
                                              date: monthExpensess['costs'][i]
                                                      ['date']
                                                  .toString())));
                                });
                          } else {
                            return CircularProgressIndicator.adaptive();
                          }
                        }))
              ]);
            }));
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Color.fromARGB(0, 29, 4, 4),
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 5,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.blueGrey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'June';
        break;
      case 6:
        text = 'July';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sept';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;

      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = value.toInt();
            });
            searchInfos(selectedIndex);
          },
          child: Text(text, style: style)),
    );
  }

  // Tiles config
  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  //Bar gradientColor
  LinearGradient get selectedGradient => const LinearGradient(
        colors: [
          Colors.blueGrey,
          Colors.greenAccent,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );
}

LinearGradient get barsGradient => const LinearGradient(
      colors: [
        Colors.blueGrey,
        Colors.redAccent,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.6,
      child: Home(),
    );
  }
}
