import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_list_flutter/screens/offer_screen.dart';

class HerderCard extends StatelessWidget {
  const HerderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  radius: 25.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Container(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anjali Arora',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF344054),
                        ),
                      ),
                      Text(
                        'Anjali@shreyansign.com',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                          color: Color(0xFF667085),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OffersScreen(),
                      ),
                    );
                  },
                  child: Container(
                    // width: 20,
                    // height: 20,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F5FF),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/awardicon.svg',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/notification_Icon.svg',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
