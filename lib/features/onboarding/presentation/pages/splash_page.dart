import 'package:go_router/go_router.dart';
import 'package:schoolmate/core/file_path.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    // ২ সেকেন্ড অপেক্ষা করে ড্যাশবোর্ডে নেভিগেট করবে (Auth Logic এখানে যুক্ত করা যাবে ভবিষ্যতে)
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      context.go(OnboardingPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.school, size: 80, color: Theme.of(context).colorScheme.primary),
            SizedBox(height: 24),
            Text(
              "Schoolmate",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Institution Management System",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.primary,
                letterSpacing: 0.9,
              ),
            ),
            SizedBox(height: 48),
            CircularProgressIndicator(color: Theme.of(context).colorScheme.primary, strokeWidth: 3),
          ],
        ),
      ),
    );
  }
}
