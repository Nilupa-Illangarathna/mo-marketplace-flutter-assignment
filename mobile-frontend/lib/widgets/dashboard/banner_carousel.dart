import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardBannerCarousel extends StatelessWidget {
  const DashboardBannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = [
      'https://picsum.photos/800/400?1',
      'https://picsum.photos/800/400?2',
      'https://picsum.photos/800/400?3',
    ];

    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              final uri = Uri.parse('https://google.com');
              if (await canLaunchUrl(uri)) {
                launchUrl(uri);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  banners[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
