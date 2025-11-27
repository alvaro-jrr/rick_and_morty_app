// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$apiListPageRoute, $prefsListPageRoute];

RouteBase get $apiListPageRoute => GoRouteData.$route(
  path: '/api-list',
  factory: $ApiListPageRoute._fromState,
);

mixin $ApiListPageRoute on GoRouteData {
  static ApiListPageRoute _fromState(GoRouterState state) =>
      const ApiListPageRoute();

  @override
  String get location => GoRouteData.$location('/api-list');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $prefsListPageRoute => GoRouteData.$route(
  path: '/prefs',
  factory: $PrefsListPageRoute._fromState,
  routes: [
    GoRouteData.$route(path: 'new', factory: $NewPrefsPageRoute._fromState),
    GoRouteData.$route(path: ':id', factory: $PrefsDetailPageRoute._fromState),
  ],
);

mixin $PrefsListPageRoute on GoRouteData {
  static PrefsListPageRoute _fromState(GoRouterState state) =>
      const PrefsListPageRoute();

  @override
  String get location => GoRouteData.$location('/prefs');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $NewPrefsPageRoute on GoRouteData {
  static NewPrefsPageRoute _fromState(GoRouterState state) =>
      const NewPrefsPageRoute();

  @override
  String get location => GoRouteData.$location('/prefs/new');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PrefsDetailPageRoute on GoRouteData {
  static PrefsDetailPageRoute _fromState(GoRouterState state) =>
      PrefsDetailPageRoute(id: int.parse(state.pathParameters['id']!));

  PrefsDetailPageRoute get _self => this as PrefsDetailPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/prefs/${Uri.encodeComponent(_self.id.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
