import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hakathon_with_mts/core/enums/app_route.dart';
import 'package:hakathon_with_mts/core/feature/device/presentation/widgets/adress_lamp_widget.dart';
import 'package:hakathon_with_mts/core/feature/device/presentation/widgets/adress_parking_widget.dart';
import 'package:hakathon_with_mts/core/feature/device/presentation/widgets/adress_trash_widget.dart';
import 'package:hakathon_with_mts/core/feature/main/presentation/bloc/sensor_bloc.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';
import 'package:hakathon_with_mts/core/shared/icons.dart';
import 'package:hakathon_with_mts/core/widgets/button_app.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool isExpandParking = false;
  bool isExpandTrash = false;
  bool isExpandLamp = false;

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
          Expanded(child: _getModeWidget()),
        ],
      ),
    );
  }

  Widget _getModeWidget() {
    if (_tabController.index == 0) {
      return BlocBuilder<SensorBloc, SensorState>(
        builder: (context, state) {
          if (state is SensorLoading) {
            return Center(
              child: CircularProgressIndicator(color: redMainColor),
            );
          }
          if (state is SensorError) {
            return Column(
              children: [
                Text(
                  state.message,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                ButtonApp(
                  onPressed: () {
                    context.read<SensorBloc>().add(SensorGetSensors());
                  },
                  width: 90,
                ),
              ],
            );
          }
          if (state is SensorLoaded) {
            return Container(
              padding: const EdgeInsets.only(left: 20),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpandParking = !isExpandParking;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          'Умные парковки',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(fontFamily: "MTSWideBold"),
                        ),

                        const SizedBox(width: 5),

                        Icon(
                          isExpandParking
                              ? Icons.keyboard_arrow_down
                              : Icons.chevron_right,
                          size: 32,
                        ),
                      ],
                    ),
                  ),
                  isExpandParking
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            state.sensors
                                .map(
                                  (e) =>
                                      e.type! == 'PARKING'
                                          ? AdressParkingWidget(
                                            adress: e.name!,
                                            onTap: () {
                                              context.go(
                                                AppRoutes.device.path +
                                                    AppRoutes.parking.fullPath(
                                                      '1',
                                                    ),
                                              );
                                            },
                                          )
                                          : SizedBox.shrink(),
                                )
                                .toList(),
                      )
                      : SizedBox.shrink(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpandLamp = !isExpandLamp;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          'Умные фонари',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(fontFamily: "MTSWideBold"),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          isExpandLamp
                              ? Icons.keyboard_arrow_down
                              : Icons.chevron_right,
                          size: 32,
                        ),
                      ],
                    ),
                  ),
                  isExpandLamp
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children:
                            state.sensors
                                .map(
                                  (e) =>
                                      e.type! == 'LIGHT'
                                          ? AdressLampWidget(
                                            adress: e.name!,
                                            onTap: () {
                                              context.go(
                                                AppRoutes.device.path +
                                                    AppRoutes.lamp.fullPath(
                                                      '1',
                                                    ),
                                              );
                                            },
                                          )
                                          : SizedBox.shrink(),
                                )
                                .toList(),
                      )
                      : SizedBox.shrink(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpandTrash = !isExpandTrash;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          'Умные урны',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(fontFamily: "MTSWideBold"),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          isExpandTrash
                              ? Icons.keyboard_arrow_down
                              : Icons.chevron_right,
                          size: 32,
                        ),
                      ],
                    ),
                  ),
                  isExpandTrash
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children:
                            state.sensors
                                .map(
                                  (e) =>
                                      e.type! == 'TRASH_BIN'
                                          ? AdressTrashWidget(
                                            adress: e.name!,
                                            onTap: () {
                                              context.go(
                                                AppRoutes.device.path +
                                                    AppRoutes.trash.fullPath(
                                                      '1',
                                                    ),
                                              );
                                            },
                                          )
                                          : SizedBox.shrink(),
                                )
                                .toList(),
                      )
                      : SizedBox.shrink(),
                ],
              ),
            );
          }
          return Container();
        },
      );
    } else {
      return Center(
        child: ListView(
          children: [
            SvgPicture.asset(emptyImage, width: 120, height: 120),
            const SizedBox(height: 24),
            Text(
              textAlign: TextAlign.center,
              'Здесь пока пусто',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontFamily: "MTSWideBold",
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Icon(Icons.sentiment_dissatisfied, size: 40),
          ],
        ),
      );
    }
  }
}
