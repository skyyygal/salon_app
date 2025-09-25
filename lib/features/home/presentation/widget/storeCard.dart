import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oasis_salon_app/features/home/data/data_sources/models/store_models.dart';

class StoreCard extends ConsumerWidget {
  final StoreModel store;

  const StoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Store Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  store.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              // Store Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title + Favorite
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            store.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.favorite, color: Color(0xFFC1A15F)),
                      ],
                    ),

                    // Address
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/map.svg',
                          width: 14,
                          height: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            store.address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Rating + Distance
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.amber),
                        const SizedBox(width: 2),
                        Text(
                          store.rating.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 12),
                        SvgPicture.asset(
                          'assets/images/map_locate.svg',
                          width: 14,
                          height: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${store.distanceKm} km',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Offer
          if (store.offers.isNotEmpty)
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/offer.svg',
                  width: 14,
                  height: 14,
                  color: Colors.green,
                ),
                const SizedBox(width: 4),
                Text(
                  store.offers.first,
                  style: const TextStyle(color: Colors.green, fontSize: 12),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
