import 'package:discover/models/cart_model.dart';
import 'package:discover/screens/cart_items.dart';
import 'package:discover/screens/product_item_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> categories = [
    {'name': 'All'},
    {'name': 'Smartphones'},
    {'name': 'Headphones'},
    {'name': 'Laptop'},
    {'name': 'Watch'},
    {'name': 'Accessories'}
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discover',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartItem(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(65, 0, 0, 0),
                      width: 0,
                    ),
                  ),
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 20,
                        child: Consumer<CartModel>(
                            builder: (context, cart, child) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${cart.cartItem.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Container(
                width: 390,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(148, 228, 228, 228),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(161, 158, 158, 158),
                          fontSize: 15),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 30,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              Container(
                width: 400,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Clearance \nSales',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 130,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                '%  Up to 50%',
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 44, 166, 48),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -50,
                left: 110,
                child: ClipRect(
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    width: 350,
                    height: 350,
                    child: Image.asset(
                      'assets/iPhone.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              GestureDetector(
                child: Text(
                  'See all',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 110,
                    height: 45,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: selectedIndex == index
                            ? Colors.green
                            : Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color:
                          selectedIndex == index ? Colors.green : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        categories[index]['name']!,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(child: Consumer<CartModel>(
            builder: (context, value, child) {
              return GridView.builder(
                  itemCount: value.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two columns
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.85, // Adjust aspect ratio as needed
                  ),
                  itemBuilder: (context, index) {
                    final product = value.products[index];
                    return ProductItemList(
                      name: product['name'],
                      price: product['price'],
                      rating: List<String>.from(product['rating']),
                      images: List<String>.from(product['image']),
                      description: product['description'],
                      review: product['review'],
                      size: List<String>.from(product['size']),
                      old_price: product['old_price'],
                      productId: product['id'],
                    );
                  });
            },
          )),
        ],
      ),
    );
  }
}
