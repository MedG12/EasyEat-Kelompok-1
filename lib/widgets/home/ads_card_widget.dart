import 'package:flutter/material.dart';
import 'package:easy_eat/models/ads_model.dart';

class AdsCardWidget extends StatelessWidget {
  final Ads ads;
  final Function onTap;

  const AdsCardWidget({super.key, required this.ads, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bagian Gambar
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 150,
                minHeight: 150,
                maxWidth: 200,
                minWidth: 200,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  ads.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 8),
            Text(
              ads.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ],
        ));
  }
}
