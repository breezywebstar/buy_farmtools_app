import 'package:flutter/material.dart';

class ToolModel extends ChangeNotifier {
  final List _toolsItems = [
    [
      'Cutlass',
      '4000',
      'lib/images/cutlass.png',
      Colors.blue,
      'It is used for cutting tree branches, weeds and other plant materials in farmlands.'
    ],
    [
      'Harvester',
      '8000',
      'lib/images/harvester.png',
      Colors.pink,
      'A combine harvester is an essential farm equipment as it reduces lots of time and costs associated with harvesting'
    ],
    [
      'Nut and Bolt',
      '8000',
      'lib/images/nutandbolt.png',
      Colors.indigo,
      'To install heavy machines in wind farms, these fasteners are used to fix their inner parts.'
    ],
    [
      'Rake',
      '2500',
      'lib/images/rake.png',
      Colors.teal,
      'You can use a rake for scooping, scraping, gathering, or leveling materials, such as soil, mulch, or leaves'
    ],
    [
      'shovel',
      '1000',
      'lib/images/shovel.png',
      Colors.yellow,
      'Shovel tool helps with digging and transplanting soil, making shallow trenches, and in removing dirt or debris.'
    ],
    [
      'Axe',
      '800',
      'lib/images/smallaxe.png',
      Colors.orange,
      'Farmers use the axe to carry out the activities of splitting/slicing wood, cutting wood and uprooting tree stumps.'
    ],
    [
      'Watering Can',
      '5000',
      'lib/images/wateringcan.png',
      Colors.lime,
      'This farm tool is used for the light irrigation of crops in the dry season to prevent them from wilting and dying.'
    ],
    [
      'Wheel Barrow',
      '5000',
      'lib/images/wheelbarrow.png',
      Colors.grey,
      'Wheelbarrows are used for a variety of things, such as moving rock, mulch, or compost to the garden, moving trees or large shrubs from one spot to another, hauling bricks, disposing of garden debris, or even for mixing concrete or fertilizers.'
    ]
  ];
  final List _toolsCarts = [];

  get toolsItems => _toolsItems;
  get toolsCarts => _toolsCarts;

//add tooolls to cart
  void addToolsToCart(int index) {
    _toolsCarts.add(_toolsItems[index]);

    notifyListeners();
  }

//remove tools fromm cart
  void removeToolsFromCart(int index) {
    _toolsCarts.removeAt(index);
    notifyListeners();
  }

//calculate total price of tools in carts
  String cartCalculator() {
    double totalPrice = 0;
    for (int i = 0; i < _toolsCarts.length; i++) {
      totalPrice += double.parse(_toolsCarts[i][1]);
    }
    return totalPrice.toStringAsFixed(3);
  }
}
