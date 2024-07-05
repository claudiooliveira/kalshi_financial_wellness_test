import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/presentation/bloc/home_bloc.dart';
import 'package:home/src/presentation/router/home_router.dart';
import 'package:home/src/presentation/router/home_router_impl.dart';
import 'package:home/src/presentation/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class HomeFeature extends StatelessWidget {
  HomeFeature({
    super.key,
    HomeBloc? bloc,
    HomeRouter? router,
  })  : _bloc = bloc ?? HomeBloc(),
        _router = router ?? HomeRouterImpl();

  final HomeBloc _bloc;
  final HomeRouter _router;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => _bloc,
        ),
        Provider<HomeRouter>.value(value: _router),
      ],
      child: const HomeScreen(),
    );
  }
}
