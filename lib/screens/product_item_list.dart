// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:discover/screens/preview_item.dart';

class ProductItemList extends StatelessWidget {
  final String name;
  final String price;
  final List<String> rating;
  final List<String> images;
  final String description;
  final String review;
  final List<String> size;
  final String old_price;
  final int productId;

  const ProductItemList({
    super.key,
    required this.name,
    required this.price,
    required this.rating,
    required this.images,
    required this.description,
    required this.review,
    required this.size,
    required this.old_price,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreviewItem(
              product: {
                'name': name,
                'price': price,
                'rating': rating,
                'image': images,
                'description': description,
                'review': review,
                'size': size,
                'old price': old_price,
              },
              productId: productId,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(37, 158, 158, 158),
            ),
            child: Image.asset(
              images.first,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    '\$$price',
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
              const SizedBox(width: 20),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    rating[0],
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
