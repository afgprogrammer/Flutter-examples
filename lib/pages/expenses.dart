import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  bool _isLoaded = false;

  List<dynamic> _services = [
    ['Transfer', Iconsax.export_1, Colors.blue],
    ['Top-up', Iconsax.import, Colors.pink],
    ['Bill', Iconsax.wallet_3, Colors.orange],
    ['More', Iconsax.more, Colors.green],
  ];

  List<dynamic> _transactions = [
    [
      'Amazon',
      'https://img.icons8.com/office/2x/amazon.png',
      '6:25pm',
      '\$8.90'
    ],
    [
      'Cash from ATM',
      'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png',
      '5:50pm',
      '\$200.00'
    ],
    [
      'Netflix',
      'https://img.icons8.com/color/2x/netflix-desktop-app.png',
      '2:22pm',
      '\$13.99'
    ],
    [
      'App Store',
      'https://img.icons8.com/fluency/2x/apple-app-store.png',
      '6:25pm',
      '\$4.99'
    ],
    [
      'Cash from ATM',
      'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png',
      '5:50pm',
      '\$200.00'
    ],
    [
      'Netflix',
      'https://img.icons8.com/color/2x/netflix-desktop-app.png',
      '2:22pm',
      '\$13.99'
    ],
  ];

  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    // Simulate loading
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E1117),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.58,
            elevation: 0,
            pinned: true,
            stretch: true,
            toolbarHeight: 80,
            backgroundColor: const Color(0xff161b22),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            title: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _isScrolled ? 1.0 : 0.0,
              child: Column(
                children: [
                  const Text(
                    "\$ 1840.00",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 4,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade800,
                    ),
                  )
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              title: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _isScrolled ? 0.0 : 1.0,
                child: FadeIn(
                  duration: const Duration(milliseconds: 1500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Total in November",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "\$",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 22,
                            ),
                          ),
                          const Text(
                            "1,840.00",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: LineChart(
                          mainData(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 4,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade800,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              SizedBox(
                height: 115,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _services.length,
                  padding: const EdgeInsets.only(top: 20),
                  itemBuilder: (context, index) {
                    return FadeInDown(
                      delay: Duration(milliseconds: index * 100),
                      duration: Duration(milliseconds: (index + 1) * 200),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xff161B22),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Icon(
                                    _services[index][1],
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _services[index][0],
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ]),
          ),
          SliverFillRemaining(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Today",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$1,145.00",
                        style: TextStyle(
                          color: Colors.blueGrey.shade200,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _transactions.length,
                      itemBuilder: (context, index) {
                        return FadeInDown(
                          duration: const Duration(milliseconds: 1500),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xff161B22),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      _transactions[index][1],
                                      width: 50,
                                      height: 50,
                                    ),
                                    const SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _transactions[index][0],
                                          style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          _transactions[index][2],
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade700,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  _transactions[index][3],
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade200,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Charts Data
  List<Color> gradientColors = const [
    Color(0xffe68823),
    Color(0xffe68823),
  ];

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        horizontalInterval: 1.3,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            dashArray: const [3, 4],
            color: const Color(0xff37434d).withOpacity(0.2),
            strokeWidth: 2,
          );
        },
        drawVerticalLine: false,
      ),

      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 20,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 1:
                  return textTitle('MAR');
                case 4:
                  return textTitle('JUN');
                case 7:
                  return textTitle('SEP');
                case 10:
                  return textTitle('OCT');
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            reservedSize: 25,
          ),
        ),
      ),

      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,

      lineTouchData: LineTouchData(
        handleBuiltInTouches: true,
        // tooltipBgColor: const Color(0xff2e3747).withOpacity(0.8),
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.white.withOpacity(0.1),
                strokeWidth: 1,
                dashArray: const [4, 3],
              ),
              FlDotData(
                show: false,
                getDotPainter:
                    (spot, percent, barData, index) => FlDotCirclePainter(
                  radius: 8,
                  color: Colors.black,
                  strokeWidth: 2,
                  strokeColor: Colors.black,
                ),
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(8),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                '\$${touchedSpot.y.round()}0.00',
                const TextStyle(color: Colors.white, fontSize: 12.0),
              );
            }).toList();
          },
        ),
      ),

      lineBarsData: [
        // First line
        LineChartBarData(
          spots: _isLoaded
              ? [
                  FlSpot(0, 3),
                  FlSpot(2.4, 2),
                  FlSpot(4.4, 3),
                  FlSpot(6.4, 3.1),
                  FlSpot(8, 4),
                  FlSpot(9.5, 4),
                  FlSpot(11, 5),
                ]
              : [
                  FlSpot(0, 0),
                  FlSpot(2.4, 0),
                  FlSpot(4.4, 0),
                  FlSpot(6.4, 0),
                  FlSpot(8, 0),
                  FlSpot(9.5, 0),
                  FlSpot(11, 0),
                ],
          isCurved: true,
          color: Colors.orange,
          barWidth: 1,
          dotData: FlDotData(show: false),
          // belowBarData: BarAreaData(
          //   show: true,
          //   color: Colors.orange.withOpacity(0.1),
          // ),
        ),
        // Second line
        LineChartBarData(
          spots: _isLoaded
              ? [
                  FlSpot(0, 4),
                  FlSpot(2.4, 3),
                  FlSpot(4.4, 5),
                  FlSpot(6.4, 3.8),
                  FlSpot(8, 3.8),
                  FlSpot(9.5, 5),
                  FlSpot(11, 5),
                ]
              : [
                  FlSpot(0, 0),
                  FlSpot(2.4, 0),
                  FlSpot(4.4, 0),
                  FlSpot(6.4, 0),
                  FlSpot(8, 0),
                  FlSpot(9.5, 0),
                  FlSpot(11, 0),
                ],
          isCurved: true,
          color: Colors.blue,
          barWidth: 1,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            // show: true,
            // gradient: LinearGradient(colors: )
          ),
        ),
      ],
    );
  }

  /// Helper to return a simple Text widget for the axis labels
  Widget textTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xff68737d),
        fontWeight: FontWeight.bold,
        fontSize: 8,
      ),
    );
  }
}
