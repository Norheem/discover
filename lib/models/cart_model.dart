import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _products = [
    {
      'id': 0,
      'image': [
        'assets/airpod.png',
        'assets/airpodblack.png',
      ],
      'name': 'Airpods',
      'size': [
        '20 MB',
        '50 MB',
        '100 MB',
      ],
      'rating': [
        '4.9',
        '98%',
      ],
      'review': '100 reviews',
      'old_price': '150.00',
      'price': '132.00',
      'color': [
        'white',
        'red',
        'black',
        'blue',
        'green',
      ],
      'description':
          'With plenty of talk and listen time, voice-activated Siri access, and an available wireless charging case',
    },
    {
      'id': 1,
      'image': [
        'assets/macbook.png',
        'assets/macbook2.png',
      ],
      'name': 'MacBook Air 13',
      'size': [
        '2 TB',
        '1 TB',
        '512 GB',
      ],
      'rating': [
        '5.0',
        '100%',
      ],
      'review': '50 reviews',
      'old_price': '1500.00',
      'price': '1100.00',
      'color': [
        'white',
        'red',
        'black',
        'blue',
        'green',
      ],
      'description':
          'FaceTime HD camera with advanced image signal processor for clearer, sharper video calls. Three-microphone array focuses on your voice instead of what\'s going on around you.'
    },
    {
      'id': 2,
      'image': [
        'assets/razerKaira.png',
        'assets/razerKaira2.png',
      ],
      'name': 'Razer Kaira Pro',
      'size': [
        '20 MB',
        '50 MB',
        '100 MB',
      ],
      'rating': [
        '4.7',
        '94%',
      ],
      'review': '120 reviews',
      'old_price': '180.00',
      'price': '153.00',
      'color': [
        'white',
        'red',
        'black',
        'blue',
        'green',
      ],
      'description':
          'Razer Kaira Pro for Xbox—a wireless Xbox Series X headset that supports mobile Xbox gaming',
    },
    {
      'id': 3,
      'image': [
        'assets/iPhone13.png',
        'assets/iPhone132.png',
      ],
      'name': 'iPhone 13',
      'size': [
        '512 GB',
        '256 GB',
        '128 GB',
      ],
      'rating': [
        '4.6',
        '92%',
      ],
      'review': '140 reviews',
      'old_price': '900.00',
      'price': '600.00',
      'color': [
        'white',
        'red',
        'black',
        'blue',
        'green',
      ],
      'description':
          'The iPhone 13 features flat edges, an aerospace-grade aluminum enclosure, and a glass back. It has a Super Retina XDR Display with a 2532x1170 resolution at 460 pixels per inch',
    },
    {
      'id': 4,
      'image': [
        'assets/wirelessController.png',
        'assets/wirelessController2.png',
      ],
      'name': 'Wireless Controller',
      'size': ['20 MB', '50 MB', '100 MB'],
      'rating': [
        '4.2',
        '84%',
      ],
      'review': '3000 reviews',
      'old_price': '110.00',
      'price': '77.00',
      'color': [
        'white',
        'red',
        'black',
        'blue',
        'green',
      ],
      'description':
          'A more console-like experience: using a Bluetooth controller can make the experience of playing mobile games feel more like playing games on a console',
    },
    {
      'id': 5,
      'image': [
        'assets/xbox.png',
        'assets/xboxSeries.png',
      ],
      'name': 'Xbox series X',
      'size': [
        '1 TB',
        '825 GB',
        '512 GB',
      ],
      'rating': [
        '4.8',
        '94%',
      ],
      'review': '117 reviews',
      'old_price': '800.00',
      'price': '570.00',
      'color': [
        'white',
        'red',
        'black',
        'blue',
        'green',
      ],
      'description':
          'The Microsoft Xbox Series X gaming console is capable of impressing with minimal boot times and mesmerizing visual effects when playing games at up to 120 frames per second',
    },
  ];

  get products => _products;

  List _cartItem = [];

  get cartItem => _cartItem;

  void addToCart(int productId) {
    if (!_cartItem.contains(products[productId])) {
      Map<String, dynamic> newItem = Map.from(products[productId]);
      newItem['quantity'] = 1; // Initialize quantity field
      _cartItem.add(newItem);
      notifyListeners();
    }
  }

  bool isItemInCart(int productId) {
    return _cartItem.any((item) => item['id'] == productId);
  }

  //remove item from cart
  void removeItemFromCart(int index) {
    _cartItem.removeAt(index);
    notifyListeners();
  }

  double calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItem.length; i++) {
      double itemPrice = double.parse(_cartItem[i]['price']);
      int itemQuantity =
          _cartItem[i]['quantity'] ?? 1; // Default to 1 if quantity is null
      totalPrice += itemPrice * itemQuantity;
    }
    return totalPrice;
  }

  // Increment quantity of item
  void incrementQuantity(int index) {
    _cartItem[index]['quantity']++;
    notifyListeners();
  }

  // Decrement quantity of item
  void decrementQuantity(int index) {
    if (_cartItem[index]['quantity'] > 1) {
      _cartItem[index]['quantity']--;
      notifyListeners();
    }
  }
}
