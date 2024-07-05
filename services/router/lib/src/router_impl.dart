import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router/router.dart';

class AppRouterService implements RouterService {
  static AppRouterService? _instance;
  static late GoRouter _goRouter;

  static AppRouterService of(BuildContext context) {
    _instance ??= AppRouterService();
    _goRouter = GoRouter.of(context);
    return _instance!;
  }

  @override
  RouterConfig<Object> config(dynamic config) {
    return config;
  }

  @override
  Future<T?> pushNamed<T>(
    String path, {
    Map<String, String>? params,
    Map<String, dynamic>? queryParams,
    RouteArgs? extra,
  }) {
    return _goRouter.pushNamed<T>(
      path,
      pathParameters: params ?? {},
      queryParameters: queryParams ?? {},
      extra: extra,
    );
  }

  @override
  Future<T?> push<T>(
    String location, {
    RouteArgs? extra,
  }) {
    return _goRouter.push(
      location,
      extra: extra,
    );
  }

  @override
  void pushAndRemoveAll(
    String location, {
    RouteArgs? extra,
  }) {
    return _goRouter.go(
      location,
      extra: extra,
    );
  }

  @override
  void pop<T>(dynamic value) {
    return _goRouter.pop<T?>(value);
  }
}
