import 'package:caffyne/dataManager.dart';
import 'package:caffyne/dataModels.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({
    super.key,
    required this.dataManager,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: FutureBuilder(
          future: dataManager.getMenu(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var categories = snapshot.data as List<Category>;
              return ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text(
                              categories[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: categories[index].products.length,
                              itemBuilder: (context, prodIndex) {
                                var prod =
                                    categories[index].products[prodIndex];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ProductItem(
                                    product: prod,
                                    onAdd: (addedProduct) {
                                      dataManager.addToCart(addedProduct);
                                    },
                                  ),
                                );
                              }),
                        ],
                      ),
                    );
                  });
            } else {
              if (snapshot.hasError) {
                return Text("There was an error fetching the menu !!!");
              } else {
                return CircularProgressIndicator();
              }
            }
          },
        ));
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;

  const ProductItem({
    super.key,
    required this.product,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          child: Column(
            children: [
              Image.network(product.imageURL),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Container(
                            height: 2,
                          ),
                          Text("\$${product.price.toStringAsFixed(2)}"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                          onPressed: () {
                            onAdd(product);
                          },
                          child: Text("Add")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 10,
        )
      ],
    );
  }
}
