import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hakathon_with_mts/core/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:hakathon_with_mts/core/feature/main/presentation/bloc/sensor_bloc.dart';
import 'package:hakathon_with_mts/core/mtc_home.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(
      ProviderScope(
        child: MultiProvider(
          providers: [
            BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
            BlocProvider<SensorBloc>(create: (context) => SensorBloc()),
          ],
          child: const MTCHome(),
        ),
      ),
    );
  });
}
