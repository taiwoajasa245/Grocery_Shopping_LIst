import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListTag extends StatelessWidget {
  const ListTag({
    super.key,
    required this.label1,
    required this.label2,
  });

  final String label1;
  final String label2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.list,
                  size: 20.0,
                ),
              ),
              Text(
                label1,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  'assets/images/tag_Icon.svg',
                  height: 20.0,
                ),
              ),
              Text(
                label2,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
