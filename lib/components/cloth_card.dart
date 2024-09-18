import 'package:flutter/material.dart';
import 'package:playground/components/icon_container.dart';
import 'package:playground/models/cloth.dart';

class ClothCard extends StatefulWidget {
  const ClothCard({
    super.key,
    required this.cloth,
    required this.cartScreen,
  });

  final Cloth cloth;
  final bool cartScreen;

  @override
  State<ClothCard> createState() => _ClothCardState();
}

class _ClothCardState extends State<ClothCard> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.asset(
              widget.cloth.clothUrl,
              width: 50,
            ),
            const SizedBox(width: 10),
            if (widget.cartScreen == true)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cloth.clothName,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(
                    '\$${widget.cloth.clothPrice * _count}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  Text(widget.cloth.clothName),
                  const Text('23 Mar\'2021'),
                ],
              ),
            const Spacer(),
            if (widget.cartScreen == true)
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (_count == 1) {
                        return;
                      }
                      setState(() {
                        _count = _count - 1;
                      });
                    },
                    child: const IconContainer(icon: Icons.remove),
                  ),
                  const SizedBox(width: 8),
                  Text(_count.toString()),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _count = _count + 1;
                      });
                    },
                    child: const IconContainer(icon: Icons.add),
                  ),
                ],
              )
            else
              Text(
                '\$${widget.cloth.clothPrice}',
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}