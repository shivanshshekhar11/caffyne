import 'package:caffyne/dataManager.dart';
import 'package:caffyne/dataModels.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  final DataManager dataManager;
  const OrdersPage({
    super.key,
    required this.dataManager,
  });

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.dataManager.itemsInCart.isEmpty) {
      return SizedBox(
        height: 350,
        child: Center(
          child: Text(
            "Your order box is empty.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Total:",
                  style: TextStyle(
                    fontSize: 25,
                  )),
              Container(
                width: 5,
              ),
              Text("\$${widget.dataManager.cartTotal()}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: widget.dataManager.itemsInCart.length,
          itemBuilder: (context, index) {
            var itemInCart = widget.dataManager.itemsInCart[index];

            return OrderItem(
                item: itemInCart,
                onRemove: (removedProduct) {
                  setState(() {
                    widget.dataManager.removeFromCart(removedProduct);
                  });
                });
          },
        ),
      ]),
    );
  }
}

class OrderItem extends StatelessWidget {
  final ItemInCart item;
  final Function onRemove;
  const OrderItem({Key? key, required this.item, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("${item.quantity}x"),
                )),
            Expanded(
                flex: 6,
                child: Text(
                  item.item.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            Expanded(
                flex: 2,
                child: Text("\$" +
                    (item.item.price * item.quantity).toStringAsFixed(2))),
            Expanded(
                flex: 1,
                child: IconButton(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    onPressed: () {
                      onRemove(item.item);
                    },
                    icon: const Icon(Icons.delete)))
          ],
        ),
      ),
    );
  }
}
