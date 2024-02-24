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
                height: 5,
              ),
              Expanded(
                child: Consumer<CartModel>(
                  builder: (context, cart, child) {
                    return ListView.builder(
                      itemCount: cart.cartItem.length,
                      itemBuilder: (context, index) {
                        // Access each cart item from cart.cartItem[index]
                        Map<String, dynamic> item = cart.cartItem[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(64, 158, 158, 158),
                            ),
                          ),
                          child: ListTile(
                            leading: Container(
                              height: 500,
                              width: 80,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(37, 158, 158, 158),
                              ),
                              child: Image.asset(
                                item['image'][0],
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(item['name']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['size'][0],
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$${(double.parse(item['price']) * (cart.cartItem[index]['quantity'] ?? 1)).toStringAsFixed(2)}',
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),

                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            var cart = Provider.of<CartModel>(
                                                context,
                                                listen: false);
                                            if (cart.cartItem[index]
                                                    ['quantity'] >
                                                1) {
                                              cart.decrementQuantity(index);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Quantity can\'t be less than 1'),
                                                ),
                                              );
                                            }
                                          },
                                          icon: const Icon(Icons.remove),
                                          padding: EdgeInsets.zero,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),

                                    Text(
                                      (cart.cartItem[index]['quantity'] ?? 1)
                                          .toString(),
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ), //
                                    const SizedBox(
                                      width: 10,
                                    ),

                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            cart.incrementQuantity(index);
                                          },
                                          icon: const Icon(Icons.add),
                                          padding: EdgeInsets.zero,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index);
                              },
                              icon: const Icon(Icons.cancel),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
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
