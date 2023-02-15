import 'package:flutter/material.dart';
import 'package:learningdart/component/tool_component.dart';
import 'package:learningdart/models/tool_models.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';
import 'component/tool_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CartPage();
          }));
        },
        child: Icon(
          Icons.shopping_bag,
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 40,
            ),
            Text('Good Morning',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Text(
              'We deliver farm tools to your doorstep',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Farm Tools',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Consumer<ToolModel>(builder: (context, value, index) {
                return GridView.builder(
                    itemCount: value.toolsItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      //childAspectRatio: 1 / 1,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ToolComponent(
                          toolName: value.toolsItems[index][0],
                          toolPrice: value.toolsItems[index][1],
                          imagePath: value.toolsItems[index][2],
                          color: value.toolsItems[index][3],
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: value.toolsItems[index][3][200],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30))),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return ToolDetails(
                                  detailName: value.toolsItems[index][0],
                                  detailPrice: value.toolsItems[index][1],
                                  imageDetailPath: value.toolsItems[index][2],
                                  color: value.toolsItems[index][3],
                                  detailDescription: value.toolsItems[index][4],
                                  onPressed: () {
                                    Provider.of<ToolModel>(context,
                                            listen: false)
                                        .addToolsToCart(index);
                                    print(value.toolsCarts);
                                  },
                                );
                              },
                            );
                          },
                        ),
                      );
                    });
              }),
            ),
          ]),
        ),
      ),
    );
  }
}
