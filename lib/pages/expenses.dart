import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({ Key? key }) : super(key: key);

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
    ['Amazon', 'https://img.icons8.com/office/2x/amazon.png', '6:25pm', '\$8.90'],
    ['Cash from ATM', 'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png', '5:50pm', '\$200.00'],
    ['Netflix', 'https://img.icons8.com/color/2x/netflix-desktop-app.png', '2:22pm', '\$13.99'],
    ['App Store', 'https://img.icons8.com/fluency/2x/apple-app-store.png', '6:25pm', '\$4.99'],
    ['Cash from ATM', 'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png', '5:50pm', '\$200.00'],
    ['Netflix', 'https://img.icons8.com/color/2x/netflix-desktop-app.png', '2:22pm', '\$13.99'],
  ];

  late ScrollController  _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    // set _isLoaded to true after 2 seconds
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
      backgroundColor: Color(0xff0E1117),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.58,
            elevation: 0,
            pinned: true,
            stretch: true,
            toolbarHeight: 80,
            backgroundColor: Color(0xff161b22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )
            ),
            title: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _isScrolled ? 1.0 : 0,
              child: Column(
                children: [
                  Text("\$ 1840.00", style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 20,),
                  Container(
                    height: 4,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade800
                    ),
                  )
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              title: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _isScrolled ? 0.0 : 1.0,
                child: FadeIn(
                  duration: Duration(milliseconds: 1500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Total in November", style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 10,
                      ),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("\$", style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 22
                          ),),
                          Text("1,840.00", style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ))
                        ],
                      ),
                      Container(
                        height: 200,
                        child: LineChart(
                          mainData(),
                          swapAnimationCurve: Curves.linear,
                          swapAnimationDuration: Duration(milliseconds: 1000),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 4,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade800
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
              SizedBox(height: 20),
              Container(
                height: 115,
                width: double.infinity,
                padding: EdgeInsets.only(top: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _services.length,
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
                                  color: Color(0xff161B22),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Icon(_services[index][1], color: Colors.white, size: 25,),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(_services[index][0], style: TextStyle(color: Colors.blueGrey, fontSize: 14),),
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
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Today", style: TextStyle(
                        color: Colors.blueGrey, 
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      )),
                      Text("\$1,145.00", style: TextStyle(
                        color: Colors.blueGrey, 
                        fontSize: 16, 
                        fontWeight: FontWeight.w700,
                      ),)
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 20),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _transactions.length,
                      itemBuilder: (context, index) {
                        return FadeInDown(
                          duration: Duration(milliseconds: 1500),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Color(0xff161B22),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.network(_transactions[index][1], width: 50, height: 50,),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(_transactions[index][0], style: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w500, fontSize: 14),),
                                        SizedBox(height: 5,),
                                        Text(_transactions[index][2], style: TextStyle(color: Colors.blueGrey.shade700, fontSize: 12),),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(_transactions[index][3], style: TextStyle(color: Colors.blueGrey.shade200, fontSize: 16, fontWeight: FontWeight.w700),),
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
  List<Color> gradientColors = [
    const Color(0xffe68823),
    const Color(0xffe68823),
  ];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
        show: true,
        horizontalInterval: 1.6,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            dashArray: const [3, 3],
            color: const Color(0xff37434d).withOpacity(0.2),
            strokeWidth: 2,
          );
        },
        drawVerticalLine: false
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 8
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'MAR';
              case 4:
                return 'JUN';
              case 7:
                return 'SEP';
              case 10:
                return 'OCT';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 25,
          margin: 12,
        ),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.white.withOpacity(0.1),
                strokeWidth: 2,
                dashArray: [3, 3],
              ),
              FlDotData(
                show: false,
                getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                    radius: 8,
                    color: [
                      Colors.black,
                      Colors.black,
                    ][index],
                    strokeWidth: 2,
                    strokeColor: Colors.black,
                  ),
              ),
            );
          }).toList();
        },
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(8),
          tooltipBgColor: Color(0xff2e3747).withOpacity(0.8),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                '\$${touchedSpot.y.round()}0.00',
                const TextStyle(color: Colors.white, fontSize: 12.0),
                
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: _isLoaded ? [
            FlSpot(0, 3),
            FlSpot(2.4, 2),
            FlSpot(4.4, 3),
            FlSpot(6.4, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 4),
            FlSpot(11, 5),
          ] : [
            FlSpot(0, 0),
            FlSpot(2.4, 0),
            FlSpot(4.4, 0),
            FlSpot(6.4, 0),
            FlSpot(8, 0),
            FlSpot(9.5, 0),
            FlSpot(11, 0)
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradientFrom: Offset(0, 0),
            gradientTo: Offset(0, 1),
            colors: [
              Color(0xffe68823).withOpacity(0.1),
              Color(0xffe68823).withOpacity(0),
            ]
          ),
        ),
        LineChartBarData(
          spots: _isLoaded ? [
            FlSpot(0, 4),
            FlSpot(2.4, 3),
            FlSpot(4.4, 5),
            FlSpot(6.4, 3.8),
            FlSpot(8, 3.8),
            FlSpot(9.5, 5),
            FlSpot(11, 5),
          ] : [
            FlSpot(0, 0),
            FlSpot(2.4, 0),
            FlSpot(4.4, 0),
            FlSpot(6.4, 0),
            FlSpot(8, 0),
            FlSpot(9.5, 0),
            FlSpot(11, 0)
          ],
          isCurved: true,
          colors: [
            Color(0xff4e65fe).withOpacity(0.5),
            Color(0xff4e65fe).withOpacity(0),
          ],
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradientFrom: Offset(0, 0),
            gradientTo: Offset(0, 1),
            colors: [
              Colors.blue.withOpacity(0.1),
              Colors.blue.withOpacity(0),
            ]
          ),
        ),
      ],
    );
  }
}