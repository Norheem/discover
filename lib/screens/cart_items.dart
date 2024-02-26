import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:discover/models/cart_model.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    double delivery = 5;
    String subtotal =
        (Provider.of<CartModel>(context).calculateTotal().toStringAsFixed(2));

    String subtotalWithDelivery =
        (Provider.of<CartModel>(context).calculateTotal() + delivery)
            .toStringAsFixed(2);
    double discount = 0.40;
    String finalPrice = (double.parse(subtotalWithDelivery) * (1 - discount))
        .toStringAsFixed(2);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(65, 0, 0, 0),
                          width: 0,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Color.fromARGB(184, 0, 0, 0),
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'My cart',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(154, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(65, 0, 0, 0),
                        width: 0,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.more_horiz,
                          color: Color.fromARGB(184, 0, 0, 0),
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<CartModel>(
                builder: (context, cart, child) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                      itemCount: cart.cartItem.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> item = cart.cartItem[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          width: 400,
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image Container
                                  Container(
                                    width: 120,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          37, 158, 158, 158),
                                    ),
                                    child: Image.asset(
                                      item['image'][0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  // Expanded Column for text and icons
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Row for name and cancel icon
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Text for name
                                            Text(
                                              item['name'],
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            // Cancel icon
                                            IconButton(
                                              onPressed: () {
                                                Provider.of<CartModel>(context,
                                                        listen: false)
                                                    .removeItemFromCart(index);
                                              },
                                              icon: const Icon(Icons.cancel),
                                            ),
                                          ],
                                        ),
                                        // Text for size
                                        Text(
                                          item['size'][0],
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        // Row for price, quantity, and icons
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Text for price
                                            Text(
                                              '\$${(double.parse(item['price']) * (cart.cartItem[index]['quantity'] ?? 1)).toStringAsFixed(2)}',
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            // Icons for quantity adjustment
                                            Row(
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      var cart = Provider.of<
                                                              CartModel>(
                                                          context,
                                                          listen: false);
                                                      if (cart.cartItem[index]
                                                              ['quantity'] >
                                                          1) {
                                                        cart.decrementQuantity(
                                                            index);
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                'Quantity can\'t be less than 1'),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    icon: const Icon(
                                                        Icons.remove),
                                                    padding: EdgeInsets.zero,
                                                    alignment: Alignment.center,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    width:
                                                        10), // Add some spacing between the icons
                                                Text(
                                                  (cart.cartItem[index]
                                                              ['quantity'] ??
                                                          1)
                                                      .toString(),
                                                  style: GoogleFonts.roboto(
                                                    textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                    width:
                                                        10), // Add some spacing between the icons
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      cart.incrementQuantity(
                                                          index);
                                                    },
                                                    icon: const Icon(Icons.add),
                                                    padding: EdgeInsets.zero,
                                                    alignment: Alignment.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Divider
                              Container(
                                width: double.infinity,
                                height: 1,
                                color: const Color.fromARGB(164, 158, 158, 158),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Container(
                    width: 390,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'ADJ3AK',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Promocode applied',
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal:',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        '\$$subtotal',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Fee:',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    '\$${delivery.toStringAsFixed(2)}',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount:',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    '${(discount * 100).toStringAsFixed(0)}%',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      child: Divider(),
                    ),
                  ),
                ],
              ),
              Container(
                width: 390,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    'Check out for ' '\$$finalPrice',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
