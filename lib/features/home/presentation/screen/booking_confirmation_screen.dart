import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Success animation
              Lottie.asset(
                "assets/animations/success.json",
                height: 120,
                repeat: false,
              ),

              const SizedBox(height: 12),
              const Text(
                "Your Service Booking is Confirmed!",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 12),
              const Text(
                "Thank you for choosing Oasis Spa Haven.\n"
                "Your appointment has been successfully booked.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Your appointment on Thursday, 7 Mar 2024 at 8:00 AM",
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
                child: const Text("Done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
