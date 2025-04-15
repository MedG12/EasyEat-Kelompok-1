import 'package:easy_eat/providers/activity_provider.dart';
import 'package:flutter/material.dart';

import 'package:easy_eat/models/foodStall_model.dart';
import 'package:easy_eat/models/orderItem_model.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OngoingOrderCard extends StatelessWidget {
  const OngoingOrderCard({
    super.key,
    required this.foodStall,
    required this.stallName,
    required this.stallTotal,
    required this.items,
    required this.orderKey,
  });

  final Foodstall foodStall;
  final String stallName;
  final double stallTotal;
  final List<OrderItem> items;
  final String orderKey;

  @override
  Widget build(BuildContext context) {
    final activityProvider = Provider.of<ActivityProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Stall Photo
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 100,
                  minHeight: 100,
                  maxWidth: 100,
                  minWidth: 100,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    foodStall
                        .image, // Pastikan variabel ini benar (foodStall vs fooodStall)
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //End Stall Photo

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Modified Stall Name Row
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 2, // 2/3 space for name
                              child: Text(
                                stallName,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              flex: 1, // 1/3 space for price
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  NumberFormat.currency(
                                    locale: 'id_ID',
                                    symbol: 'Rp',
                                    decimalDigits: 0,
                                  ).format(stallTotal),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    // End Stall Name

                    const SizedBox(height: 5),

                    // Sign food status
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: activityProvider.getRemainingTime(orderKey) == 0
                            ? Color.fromRGBO(223, 216, 114, 1)
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            activityProvider.getRemainingTime(orderKey) == 0
                                ? "Sudah Selesai"
                                : "Sedang Berjalan",
                            style: TextStyle(
                                fontFamily: 'SF-Pro',
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    //end Sign food status

                    // ordered items
                    Text(
                      items.map((item) {
                        return "${item.food} x${item.qty}";
                      }).join(', '),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    //end ordered items
                  ],
                ),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
