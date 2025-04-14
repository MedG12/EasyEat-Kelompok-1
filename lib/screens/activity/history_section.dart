import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:easy_eat/providers/activity_provider.dart';

import 'package:easy_eat/widgets/activity/historyOrderCard_widget.dart';

import 'package:easy_eat/models/foodStall_model.dart';
import 'package:intl/intl.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final activityProvider = Provider.of<ActivityProvider>(context);
    final completedOrders = activityProvider.completedOrders;

    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 239, 232, 1),
      body: Center(
        child: completedOrders.isEmpty
            ? Text("Belum ada transaksi selesai")
            : ListView.builder(
                itemCount: completedOrders.length,
                itemBuilder: (context, orderIndex) {
                  final orderKey = completedOrders.keys.elementAt(orderIndex);
                  final stallsData = completedOrders[orderKey]!;
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
                          final bool isLast =
                              stallsData.values.last == stallEntry.value;
                          final items = stallEntry.value;
                          final double stallTotal = items.fold(
                              0, (sum, item) => sum + item.price * item.qty);

                          final Foodstall foodStall = foodstallList
                              .firstWhere((stall) => stall.name == stallName);
                          return HistoryOrderCard(
                              foodStall: foodStall,
                              stallName: stallName,
                              stallTotal: stallTotal,
                              items: items,
                              isLast: isLast);
                        },
                      ),
                      orderIndex == completedOrders.length - 1
                          ? const SizedBox(height: 70)
                          : const SizedBox(height: 20),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
