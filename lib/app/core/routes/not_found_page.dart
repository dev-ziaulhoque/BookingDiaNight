import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Big icon
              Icon(
                Icons.search_off_rounded,
                size: 120,
                color: isDark ? Colors.white54 : Colors.black54,
              ),
              const SizedBox(height: 32),

              // 404 text
              Text(
                "404",
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              // Headline
              Text(
                "Page not found",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              // Subtext
              Text(
                "The page you are looking for doesn't exist\nor has been moved.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),
              const SizedBox(height: 48),

              // Main button – Back to Home
              ElevatedButton.icon(
                onPressed: () => Get.offAllNamed(AppRoutes.splash), // or AppRoutes.home
                icon: const Icon(Icons.home_rounded),
                label: const Text(
                  "Go Home",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: isDark ? Colors.black : Colors.white,
                  backgroundColor: isDark ? Colors.white : Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                ),
              ),

              const SizedBox(height: 16),

              // Secondary button
              TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  "Go back",
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}