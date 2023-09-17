// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:djistore/data/models.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Hero(
              tag: product.img,
              child: SizedBox(
                width: 150,
                child: Image.asset(product.img),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 100,
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    thickness: 1,
                  ),
                  Text(product.name),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Rp ${product.price}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      Text(product.rating),
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                          height: 23,
                          width: 78,
                          decoration: BoxDecoration(
                              color: int.tryParse(product.qty)! > 0
                                  ? Colors.green
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(9)),
                          child: Center(
                            child: Text(
                              int.tryParse(product.qty)! > 0
                                  ? '${product.qty} Tersedia'
                                  : 'Terjual',
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
