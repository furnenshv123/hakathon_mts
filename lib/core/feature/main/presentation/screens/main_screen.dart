import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hakathon_with_mts/core/feature/data/models/sensor_model.dart';
import 'package:hakathon_with_mts/core/feature/main/presentation/bloc/sensor_bloc.dart';
import 'package:hakathon_with_mts/core/feature/main/presentation/widgets/occupant_widget.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';
import 'package:hakathon_with_mts/core/widgets/button_app.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late GoogleMapController _controller;
  final List<LatLng> _center = [
    LatLng(53.927337507913016, 27.681853525047426),
    LatLng(53.927437, 27.681853),
    LatLng(53.927337, 27.682353),
    LatLng(53.927237, 27.681853),
    LatLng(53.927337, 27.681353),
    LatLng(53.927437, 27.682353),
  ];
  List<String> listOfNames = [
    'Даниил Кульбицкий',
    'Иван Бобко',
    'Турчин Тимур',
    'Турчин Тимур',
    'Турчин Тимур',
  ];
  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorBloc, SensorState>(
      builder: (context, state) {
        if (state is SensorLoaded) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    'Главная',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: "MTSCompactMedium",
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        'МТС Город',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontFamily: "MTSWideBold",
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.chevron_right,
                          color: fontBlackColor,
                          size: 32,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Text(
                  'ул.Академика Купревича 1/5',
                  softWrap: true,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontFamily: "MTSCompactMedium",
                    fontSize: 24,
                    color: fontInactiveColor,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...listOfNames.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: OccupantWidget(name: e),
                        ),
                      ),
                      OccupantWidget(name: '', isAdding: true),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  height: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: GoogleMap(
                      markers: state.sensors.map((e) => _getMarker(e)).toSet(),
                      gestureRecognizers:
                          Set()..add(
                            Factory<EagerGestureRecognizer>(
                              () => EagerGestureRecognizer(),
                            ),
                          ),

                      padding: const EdgeInsets.symmetric(vertical: 30),
                      initialCameraPosition: CameraPosition(
                        target: _center[0],
                        zoom: 11,
                      ),
                      onMapCreated: _onMapCreated,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        if (state is SensorLoading) {
          return Center(child: CircularProgressIndicator(color: redMainColor));
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
        return Container();
      },
    );
  }

  Marker _getMarker(SensorModel model) {
    if (model.type == 'LIGHT') {
      return Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        markerId: MarkerId(model.id.toString()),
        position: LatLng(model.latitude!, model.longitude!),
      );
    } else if (model.type == 'PARKING') {
      return Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        markerId: MarkerId(model.id.toString()),
        position: LatLng(model.latitude!, model.longitude!),
      );
    } else {
      return Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        markerId: MarkerId(model.id.toString()),
        position: LatLng(model.latitude!, model.longitude!),
      );
    }
  }
}

// decoration: BoxDecoration(borderRadius: BorderRadius.circular(28)),
// padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
