import 'package:blumonpay_test/src/presentation/screens/auth/auth_check_screen.dart';
import 'package:blumonpay_test/src/presentation/screens/auth/splash_screen.dart';
import 'package:blumonpay_test/src/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/auth/check',
  routes: [
    GoRoute(
        path: '/noWifi',
        name: NoWifiScreen.name,
        builder: (context, state) {
          return const NoWifiScreen();
        }),
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/auth',
      name: SplashScreen.name,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/auth/check',
      name: AuthCheckScreen.name,
      builder: (context, state) {
        return const AuthCheckScreen();
      },
    ),
    GoRoute(
      path: '/auth/login',
      name: LoginScreen.name,
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(path: '/', redirect: (_, __) => '/home'),
  ],
);
