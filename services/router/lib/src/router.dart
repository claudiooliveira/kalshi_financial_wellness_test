import 'package:flutter/material.dart';
import 'package:router/src/route_args.dart';

abstract class RouterService {
  RouterService(BuildContext context);

  RouterConfig<Object> config(dynamic config);

  Future<T?> pushNamed<T>(
    String name, {
    Map<String, String>? params,
    Map<String, dynamic>? queryParams,
    RouteArgs? extra,
  });

  Future<T?> push<T>(
    String location, {
    RouteArgs? extra,
  });

  void pushAndRemoveAll(
    String location, {
    RouteArgs? extra,
  });

  void pop<T>(dynamic value);
}
