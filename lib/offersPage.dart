import 'package:flutter/material.dart';

class Offerspage extends StatelessWidget {
  const Offerspage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Offer(
          title: "Buy 1 Get 5 FREE",
          description:
              "Offer valid only on wednesdays across select stores in India.",
        ),
        Offer(
          title: "Buy 1 Get 5 FREE",
          description:
              "Offer valid only on wednesdays across select stores in India.",
        ),
        Offer(
          title: "Buy 1 Get 5 FREE",
          description:
              "Offer valid only on wednesdays across select stores in India.",
        ),
        Offer(
          title: "Buy 1 Get 5 FREE",
          description:
              "Offer valid only on wednesdays across select stores in India.",
        ),
        Offer(
          title: "Buy 1 Get 5 FREE",
          description:
              "Offer valid only on wednesdays across select stores in India.",
        ),
      ],
    );
  }
}

class Offer extends StatelessWidget {
  final String title;
  final String description;
  const Offer({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Card(
        color: Theme.of(context).colorScheme.inversePrimary,
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/background.png"),
              )),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "$title",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "$description",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
