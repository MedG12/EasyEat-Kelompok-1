import 'package:easy_eat/providers/activity_provider.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:easy_eat/widgets/cart/switchWidget.dart';
import 'package:provider/provider.dart';
import 'package:easy_eat/providers/cart_provider.dart';
import 'package:easy_eat/models/orderItem_model.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final groupedItems = cartProvider.groupedItems;
    final totalPrice = cartProvider.totalAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(239, 239, 232, 1),
      body: Stack(
        children: [
          groupedItems.isEmpty
              ? Center(child: Text("Belum ada makanan di keranjang"))
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.pin_drop,
                              size: 30,
                            ),
                            title: Text(
                              "Pickup dari",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Text(
                              cartProvider.stallNames.join(", "),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 5),
                            child: Divider(
                              height: 1,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.access_time_rounded,
                              size: 30,
                            ),
                            title: Text(
                              "Estimasi waktu memasak",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Text(
                              "10 menit",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            color: Color.fromRGBO(217, 217, 217, 1),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Text("Pesanan",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, stallIndex) {
                          final stallName =
                              groupedItems.keys.elementAt(stallIndex);
                          final items = groupedItems[stallName]!;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header stall
                              Padding(
                                padding: EdgeInsets.only(top: 12, left: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        stallName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'SF-Pro',
                                          fontSize: 17,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                   SizedBox(width: 10),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Ubah Pesanan",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'SF-Pro',
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // List items
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: items.length,
                                itemBuilder: (context, itemIndex) {
                                  final item = items[itemIndex];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 26.0, vertical: 6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${item.qty}x ${item.food}" +
                                              (item.selectedOption
                                                          ?.isNotEmpty ==
                                                      true
                                                  ? ' (${item.selectedOption})'
                                                  : ""),
                                        ),
                                        Text(
                                          NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  symbol: '',
                                                  decimalDigits: 0)
                                              .format(item.price),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 6),
                                child: Divider(height: 1),
                              ),

                              // Total per stall
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Subtotal",
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'id_ID',
                                              symbol: '',
                                              decimalDigits: 0)
                                          .format(
                                        _calculateStallTotal(items),
                                      ),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //end total

                              //Divider
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 6),
                                child: Divider(height: 1),
                              ),
                              //end Divider

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 6),
                                child: Switchwidget(
                                  stallName: stallName,
                                ),
                              ),
                              //Divider
                              Container(
                                color: Color.fromRGBO(217, 217, 217, 1),
                                width: double.infinity,
                                height: 10,
                              ),
                              //end Divider
                            ],
                          );
                        },
                        childCount: groupedItems.length,
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 170)),
                  ],
                ),
          // Floating Checkout Button
          if (groupedItems.isNotEmpty)
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 32,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      )
                    ]),
                child: Column(
                  children: [
                    Row(children: [
                      Expanded(
                        child: ListTile(
                          leading: Icon(
                            Icons.monetization_on_sharp,
                            color: Colors.black,
                            size: 40,
                          ),
                          title: Text(
                            "Tunai",
                            style: TextStyle(
                              fontFamily: "SF-Pro",
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                              "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(totalPrice)}",
                              style: TextStyle(
                                fontFamily: "SF-Pro",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 16,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Color.fromRGBO(206, 235, 187, 1),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            final activityProvider =
                                Provider.of<ActivityProvider>(context,
                                    listen: false);

                            // Convert cart items to format yang bisa diterima oleh activityProvider
                            final Map<String, List<OrderItem>> orderItems = {};
                            orderItems['cart_items'] =
                                List.from(cartProvider.items);
                            activityProvider.addOnGoingOrder(orderItems);
                            // Clear cart
                            cartProvider.clearCart();
                            // Display SnackBar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Pesanan berhasil dibuat!"),
                                duration: Duration(milliseconds: 400),
                              ),
                            );
                          },
                          child: Text("Pesan-Pickup di counter")),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  double _calculateStallTotal(List<OrderItem> items) {
    return items.fold(0, (sum, item) => sum + item.price);
  }
}
