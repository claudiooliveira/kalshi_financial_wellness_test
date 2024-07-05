import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/presentation/cubit/home_cubit.dart';
import 'package:home/src/presentation/router/home_router.dart';
import 'package:home/src/presentation/router/home_router_impl.dart';
import 'package:home/src/presentation/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class HomeFeature extends StatelessWidget {
  HomeFeature({
    super.key,
    HomeCubit? cubit,
    HomeRouter? router,
  })  : _cubit = cubit ?? HomeCubit(),
        _router = router ?? HomeRouterImpl();

  final HomeCubit _cubit;
  final HomeRouter _router;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => _cubit,
        ),
        Provider<HomeRouter>.value(value: _router),
      ],
      child: const HomeScreen(),
    );
  }
}
