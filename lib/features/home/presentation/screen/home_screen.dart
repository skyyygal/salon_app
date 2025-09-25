import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oasis_salon_app/features/home/presentation/provider/store_provider.dart';
import 'package:oasis_salon_app/features/home/presentation/screen/store_profile_screen.dart';
import 'package:oasis_salon_app/features/home/presentation/widget/gradient_text.dart';
import 'package:oasis_salon_app/features/home/presentation/widget/storeCard.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storesAsync = ref.watch(storesProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/images/map_pin.svg',
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 6),

              ShaderMask(
                shaderCallback: (bounds) =>
                    const LinearGradient(
                      colors: [Color(0xFF5B4C2D), Color(0xFFC1A15F)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: Row(
                  children: const [
                    GradientIconText(
                      text: 'Madhapur',
                      icon: Icons.arrow_drop_down,
                      fontSize: 16,
                    ),

                    // Icon(Icons.arrow_drop_down, size: 18, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'assets/images/notification.svg',
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // Search bar
          Container(
            margin: const EdgeInsets.all(12),
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for salons, services...',
                prefixIcon: const Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),

          Expanded(
            child: storesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text("Error: $err")),
              data: (stores) => ListView.builder(
                itemCount: stores.length,
                itemBuilder: (context, index) {
                  final store = stores[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StoreProfileScreen(store: store),
                        ),
                      );
                    },
                    child: StoreCard(store: store),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
