import 'package:go_router/go_router.dart';
import 'package:studtime/components/intro_page/intro_page.dart';
import 'package:studtime/components/splash_page/splash_page.dart';

class AppRouter extends GoRouter {
  AppRouter()
      : super(
          routes: [
            GoRoute(
              path: '/',
              builder: (__, _) => const SplashPage(),
            ),
            GoRoute(
              path: '/intro',
              builder: (__, _) => const IntroPage(),
            ),
          ],
        );
}
