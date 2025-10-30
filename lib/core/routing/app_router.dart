import 'package:craftechy_website/core/routing/routes.dart';
import 'package:craftechy_website/feature/about/ui/screen/about_screen.dart';
import 'package:craftechy_website/feature/careers/ui/screen/careers_screen.dart';
import 'package:craftechy_website/feature/contact/ui/screen/contact_screen.dart';
import 'package:craftechy_website/feature/home/ui/screen/home_screen.dart';
import 'package:craftechy_website/feature/process/ui/screen/process_screen.dart';
import 'package:craftechy_website/feature/services/ui/screen/services_screen.dart';
import 'package:craftechy_website/feature/work/ui/screen/work_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter{
  static final GoRouter router = GoRouter(
    initialLocation: Routes.homeRoute,
    debugLogDiagnostics: true,

    routes: [
      GoRoute(
        path: Routes.homeRoute,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.servicesRoute,
        name: 'services',
        builder: (context, state) => const ServicesScreen(),
      ),
      GoRoute(
        path: Routes.workRoute,
        name: 'work',
        builder: (context, state) => const WorkScreen(),
      ),
      GoRoute(
        path: Routes.processRoute,
        name: 'process',
        builder: (context, state) => const ProcessScreen(),
      ),
      GoRoute(
        path: Routes.aboutRoute,
        name: 'about',
        builder: (context, state) => const AboutScreen(),
      ),
      GoRoute(
        path: Routes.careersRoute,
        name: 'careers',
        builder: (context, state) => const CareersScreen(),
      ),
      GoRoute(
        path: Routes.contactRoute,
        name: 'contact',
        builder: (context, state) => const ContactScreen(),
      ),
    ],
  );
}