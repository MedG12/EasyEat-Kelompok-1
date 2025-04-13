import 'package:easy_eat/models/foodStall_model.dart';
import 'package:flutter/material.dart';

class StallCardWidget extends StatelessWidget {
  final Foodstall stall;
  final Function() onTap;
  const StallCardWidget({super.key, required this.stall, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 120,
              minHeight: 120,
              maxWidth: 120,
              minWidth: 120,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                stall.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  stall.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    stall.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF444350),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
