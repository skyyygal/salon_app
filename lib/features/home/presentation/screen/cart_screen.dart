import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oasis_salon_app/features/home/domain/entities/service_data.dart';
import 'package:oasis_salon_app/features/home/presentation/provider/cart_provider.dart';
import 'package:oasis_salon_app/features/home/presentation/screen/booking_confirmation_screen.dart'
    show BookingConfirmationScreen;

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    if (cart.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: const Center(child: Text("Your cart is empty")),
      );
    }

    final cartNotifier = ref.read(cartProvider.notifier);

    final subtotal = cart.fold<int>(0, (sum, s) => sum + s.price);
    final discount = (subtotal * 0.10).toInt();
    const additionalFee = 50;
    const convenienceFee = 20;
    final payable = subtotal - discount + additionalFee + convenienceFee;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        backgroundColor: const Color(0xFFB7995B),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final Service service = cart[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(
                      service.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      "₹${service.price} • ${service.durationMins} mins • ${service.gender}",
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => cartNotifier.removeService(service),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Row(
              children: [
                const Icon(Icons.local_offer, color: Colors.green),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "You saved ₹$discount with this offer!",
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),

          // Payment Summary
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Payment Summary",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                _summaryRow("Selected Services", "₹$subtotal"),
                _summaryRow("Discount", "-₹$discount", color: Colors.green),
                _summaryRow("Additional Fee", "₹$additionalFee"),
                _summaryRow("Convenience Fee", "₹$convenienceFee"),
                const Divider(),
                _summaryRow("Payable Amount", "₹$payable", isBold: true),
              ],
            ),
          ),

          // Bottom Pay Button
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookingConfirmationScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB7995B),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text("Pay ₹$payable"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    Color? color,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: color ?? Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
