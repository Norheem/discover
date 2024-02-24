import 'package:discover/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PreviewItem extends StatefulWidget {
  final Map<String, dynamic> product;
  final int productId;
  const PreviewItem({
    Key? key,
    required this.product,
    required this.productId,
  }) : super(key: key);

  @override
  State<PreviewItem> createState() => _PreviewItemState();
}

class _PreviewItemState extends State<PreviewItem> {
  int counter = 0;
  PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 234, 234),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, counter);
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
                  Row(
                    children: [
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
                              Icons.favorite,
                              color: Colors.red,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
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
                              Icons.power_settings_new_sharp,
                              color: Color.fromARGB(184, 0, 0, 0),
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      // color: Color.fromARGB(255, 236, 234, 234),
                    ),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.product['image'].length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          widget.product['image'][index],
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Call method to build dot indicator
                  _buildIndicator(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.product['name'],
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  '%  On sale',
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 253, 228, 1),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    widget.product['rating'][0],
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.thumb_up_alt,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    widget.product['rating'][1],
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.product['review'].toString(),
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.product['description'],
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            if (widget.product['size'] != null &&
                                widget.product['size'].isNotEmpty) ...[
                              Container(
                                height: 40,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    widget.product['size'][0],
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              if (widget.product['size'].length > 1) ...[
                                Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.product['size'][1],
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              if (widget.product['size'].length > 2) ...[
                                const SizedBox(width: 5),
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.product['size'][2],
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ] else ...[
                              Text(
                                'Product doesn\'t use memory size',
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(
                          height: 5,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '\$${widget.product['old price']}',
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '\$${widget.product['price']}',
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                final cart = Provider.of<CartModel>(context,
                                    listen: false);
                                if (!cart.isItemInCart(widget.productId)) {
                                  cart.addToCart(widget.productId);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Item added to cart'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Item is already in the cart'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                width: 220,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green,
                                ),
                                child: Center(
                                  child: Text(
                                    'Add to Cart',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
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

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.product['image'].length,
        (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.green : Colors.grey,
          ),
        ),
      ),
    );
  }
}
