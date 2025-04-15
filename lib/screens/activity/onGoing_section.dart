import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:easy_eat/providers/activity_provider.dart';

import 'package:easy_eat/widgets/activity/ongoingOrderCard_widget.dart';
import 'package:easy_eat/models/foodStall_model.dart';
import 'package:intl/intl.dart';

class OngoingSection extends StatelessWidget {
  const OngoingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final activityProvider = Provider.of<ActivityProvider>(context);
    final onGoingOrders = activityProvider.onGoingOrders;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 239, 232, 1),
      body: onGoingOrders.isEmpty
          ? const Center(child: Text('Tidak ada pesanan yang sedang berjalan'))
          : ListView.builder(
              itemCount: onGoingOrders.length,
              itemBuilder: (context, orderIndex) {
                final orderKey = onGoingOrders.keys.elementAt(orderIndex);
                final stallsData = onGoingOrders[orderKey]!;
                final orderTime =
                    DateTime.fromMillisecondsSinceEpoch(int.parse(orderKey));
                final formattedTime =
                    DateFormat('dd/MM/yyyy HH:mm').format(orderTime);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order Time
                    Container(
                      width: double.infinity,
                      color: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Text(
                        formattedTime,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Stall Items
                    ...stallsData.entries.map(
                      (stallEntry) {
                        final stallName = stallEntry.key;
                        final items = stallEntry.value;
                        final double stallTotal =
                            items.fold(0, (sum, item) => sum + item.price);

                        final Foodstall foodStall = foodstallList
                            .firstWhere((stall) => stall.name == stallName);
                        return OngoingOrderCard(
                          foodStall: foodStall,
                          stallName: stallName,
                          stallTotal: stallTotal,
                          items: items,
                          orderKey: orderKey,
                        );
                      },
                    ),
                    // Tombol ambil
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            backgroundColor:
                                activityProvider.getRemainingTime(orderKey) == 0
                                    ? Color(0xffDFD872)
                                    : Colors.grey,
                          ),
                          onPressed:
                              activityProvider.getRemainingTime(orderKey) == 0
                                  ? () {
                                      activityProvider
                                          .moveToCompleted(orderKey);
                                    }
                                  : null,
                          child: Text(
                            activityProvider.getRemainingTime(orderKey) == 0
                                ? "Ambil"
                                : "Tunggu",
                            style: TextStyle(
                              fontFamily: 'SF-Pro',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    //End Tombol ambil
                    orderIndex == onGoingOrders.length - 1
                        ? const SizedBox(height: 70)
                        : const SizedBox(height: 20),
                  ],
                );
              },
            ),
    );
  }
}
