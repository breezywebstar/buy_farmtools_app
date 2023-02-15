import 'package:flutter/material.dart';
import 'package:learningdart/models/tool_models.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text('Cart Page'),
        elevation: 0,
      ),
      body: Consumer<ToolModel>(
        builder: (context, value, child) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: value.toolsCarts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(
                        value.toolsCarts[index][2],
                      ),
                      title: Text(value.toolsCarts[index][0]),
                      subtitle: Text('₦' + value.toolsCarts[index][1]),
                      trailing: Icon(Icons.cancel_outlined),
                      onTap: () =>
                          Provider.of<ToolModel>(context, listen: false)
                              .removeToolsFromCart(index),
                    );
                  }),
            ),

            //total price and pay button

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price:',
                          style: TextStyle(color: Colors.green[100]),
                        ),
                        Text(
                          '₦' + value.cartCalculator(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(12),
                      child: Text('Place Order '),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
