import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakathon_with_mts/core/enums/app_route.dart';
import 'package:hakathon_with_mts/core/enums/entity_device.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';

class SelectedParkingScreen extends StatefulWidget {
  const SelectedParkingScreen({super.key});
  @override
  State<SelectedParkingScreen> createState() => _SelectedAdressScreenState();
}

class _SelectedAdressScreenState extends State<SelectedParkingScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      color: Colors.white,
      child: Column(
        children: [
          Center(
            child: Text(
              'Устройства',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontFamily: "MTSCompactMedium",
                fontSize: 17,
              ),
            ),
          ),
          TabBar(
            onTap: (value) {
              setState(() {});
            },
            dividerColor: Colors.transparent,
            indicatorColor: redMainColor,
            tabs: [
              Tab(
                child: Text(
                  'Общие',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontFamily: "MTSCompactMedium",
                    fontSize: 17,
                    color:
                        _tabController.index == 0
                            ? fontBlackColor
                            : fontInactiveColor,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Для дома',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontFamily: "MTSCompactMedium",
                    fontSize: 17,
                    color:
                        _tabController.index == 1
                            ? fontBlackColor
                            : fontInactiveColor,
                  ),
                ),
              ),
            ],

            controller: _tabController,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go(AppRoutes.device.path);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.chevron_left, size: 24),
                        const SizedBox(width: 5),
                        Text(
                          softWrap: true,
                          'Умные парковки',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(fontFamily: "MTSWideBold"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Количество парковок для легковых автомобилей',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: "MTSCompactMedium",
                      color: fontInactiveColor,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 22),
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(2),

                    backgroundColor: borderColor,
                    value: 0.8,
                    valueColor: AlwaysStoppedAnimation<Color>(redMainColor),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Text(
                        '7',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: "MTSText",
                          fontSize: 14,
                          color: fontInactiveColor,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '20',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: "MTSText",
                          fontSize: 14,
                          color: fontInactiveColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Количество парковок для электромобилей',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: "MTSCompactMedium",
                      color: fontInactiveColor,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 22),
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(2),
                    backgroundColor: borderColor,

                    value: 1,
                    valueColor: AlwaysStoppedAnimation<Color>(redMainColor),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Text(
                        '2',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: "MTSText",
                          fontSize: 14,
                          color: fontInactiveColor,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '2',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: "MTSText",
                          fontSize: 14,
                          color: fontInactiveColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Уровень заполненности парковки',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: "MTSCompactMedium",
                      fontSize: 14,
                      color: fontInactiveColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '22:00',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: "MTSCompact",
                          fontSize: 14,
                          color: redMainColor,
                        ),
                      ),
                      Text(
                        ' В это время обычно много свободных мест',
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: "MTSCompact",
                          color: fontInactiveColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 170,
                    child: BarChart(
                      BarChartData(
                        groupsSpace: 2,
                        borderData: FlBorderData(
                          border: Border(
                            bottom: BorderSide(width: 2, color: borderColor),
                          ),
                        ),
                        gridData: FlGridData(
                          show: false,
                        ), // Убираем пунктирные линии

                        alignment: BarChartAlignment.spaceAround,
                        maxY: 6,
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0:
                                    return Column(
                                      children: [
                                        const SizedBox(height: 8),
                                        Text('8:00'),
                                      ],
                                    );
                                  case 1:
                                    return Column(
                                      children: [
                                        Container(
                                          width: 2,
                                          height: 8,
                                          color: borderColor,
                                        ),
                                        Text('12:00'),
                                      ],
                                    );
                                  case 2:
                                    return Column(
                                      children: [
                                        Container(
                                          width: 2,
                                          height: 8,
                                          color: borderColor,
                                        ),

                                        Text('16:00'),
                                      ],
                                    );
                                  case 3:
                                    return Column(
                                      children: [
                                        Container(
                                          width: 2,
                                          height: 8,
                                          color: borderColor,
                                        ),

                                        Text('20:00'),
                                      ],
                                    );
                                  case 4:
                                    return Column(
                                      children: [
                                        const SizedBox(height: 8,),
                                        Text('00:00'),
                                      ],
                                    );

                                  default:
                                    return Text('');
                                }
                              },
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),

                        barGroups: [
                          BarChartGroupData(x: 0),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                borderRadius: BorderRadius.circular(8),
                                toY: 5,
                                color: fontInactiveColor,
                                width: 38,
                              ),
                              BarChartRodData(
                                borderRadius: BorderRadius.circular(8),

                                toY: 5,
                                color: fontInactiveColor,
                                width: 38,
                              ),
                            ],
                          ),
                          BarChartGroupData(x: 1),

                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                borderRadius: BorderRadius.circular(8),
                                toY: 5,
                                color: fontInactiveColor,
                                width: 38,
                              ),
                              BarChartRodData(
                                borderRadius: BorderRadius.circular(8),

                                toY: 5,
                                color: fontInactiveColor,
                                width: 38,
                              ),
                            ],
                          ),
                          BarChartGroupData(x: 2),

                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                borderRadius: BorderRadius.circular(8),
                                toY: 5,
                                color: fontInactiveColor,
                                width: 38,
                              ),
                              BarChartRodData(
                                borderRadius: BorderRadius.circular(8),

                                toY: 5,
                                color: fontInactiveColor,
                                width: 38,
                              ),
                            ],
                          ),
                          BarChartGroupData(x: 3),

                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                borderRadius: BorderRadius.circular(8),
                                toY: 5,
                                color: fontInactiveColor,
                                width: 38,
                              ),
                              BarChartRodData(
                                borderRadius: BorderRadius.circular(8),

                                toY: 5,
                                color: fontInactiveColor,
                                width: 38,
                              ),
                            ],
                          ),
                          BarChartGroupData(x: 4),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
