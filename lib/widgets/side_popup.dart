import 'package:flutter/material.dart';

class CustomDialogContent extends StatelessWidget {
  const CustomDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    const KpopUpTextStyle = TextStyle(
      fontFamily: 'Inter',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.only(top: 70, right: 10),
            // padding: const EdgeInsets.all(20),
            width: 295.0,
            height: 230.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextButton(
                    onPressed: () {
                      print('Hey dart');
                    },
                    child: const Text(
                      'Clear Checked Items',
                      style: KpopUpTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: TextButton(
                    child: const Text(
                      'Copy List',
                      style: KpopUpTextStyle,
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: TextButton(
                    child: const Text(
                      'Delete',
                      style: KpopUpTextStyle,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
