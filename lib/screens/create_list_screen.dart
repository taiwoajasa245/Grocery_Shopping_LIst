import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:grocery_list_flutter/screens/add_items_screen.dart';
import 'package:grocery_list_flutter/widgets/header_container.dart';
import 'package:grocery_list_flutter/widgets/round_icon_button.dart';

class CreateItemScreen extends StatelessWidget {
  const CreateItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 15.0,
            top: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HerderCard(),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        dashPattern: const [10],
                        color: const Color(0xFFEAECF0),
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/No data-pana 1.png',
                                  ),
                                ),
                                const Text(
                                  'Start by creating list',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'Your smart shopping list will be show here, start by creating a new list',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF667085),
                                    fontSize: 15.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          right: 15.0,
                          bottom: 33.0,
                        ),
                        alignment: Alignment.bottomRight,
                        child: SvgPicture.asset('assets/images/Vector.svg'),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: RoundIconButton(
                          icon: Icons.add,
                          operation: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddItems();
                              },
                            );
                          },
                        ),
                      )
                    ],
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
