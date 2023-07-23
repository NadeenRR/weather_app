import 'package:flutter/material.dart';

class MyWeatherWidget extends StatelessWidget {
  final List<Color> color;
  final String city;
  final String country;
  final String image;
  final int temp;
  final String description;
  final int tempMin;
  final int tempMax;
  final int speedWind;
  final String main;
  //final String iconCode;

  const MyWeatherWidget({
    Key? key,
    required this.color,
    required this.city,
    required this.image,
    required this.temp,
    required this.country,
    required this.description,
    required this.tempMin,
    required this.tempMax,
    required this.speedWind,
    required this.main,
 //   required this.iconCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: color,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '$city, $country',
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            Image.asset(
              // '$iconCode.png',
              image,
              height: 250,
            ),
            Text(
              main,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$temp',
                  style: const TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            // const SizedBox(
            //   height: 8,
            // ),
            Divider(
              color: Colors.white.withOpacity(0.5),
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '$tempMax',
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const Text('Temp max',
                        style: TextStyle(
                          color: Colors.white,
                        ))
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '$tempMin',
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const Text('Temp min',
                        style: TextStyle(
                          color: Colors.white,
                        ))
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '$speedWind',
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const Text(
                      'Speed wind',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );

    // GestureDetector(
    //   onTap: function,
    //   child: Container(
    //     margin: const EdgeInsets.only(bottom: 12),
    //     padding: const EdgeInsets.only(left: 12),
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: color,
    //       ),
    //       borderRadius: BorderRadius.circular(30),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    //       child: Row(
    //         children: [
    //           Expanded(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   city,
    //                   style: GoogleFonts.poppins(
    //                     fontSize: 28,
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Text(
    //                   subtitle,
    //                   style: GoogleFonts.poppins(
    //                     fontSize: 18,
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.w300,
    //                   ),
    //                 ),
    //                 Row(
    //                   textBaseline: TextBaseline.alphabetic,
    //                   crossAxisAlignment: CrossAxisAlignment.baseline,
    //                   children: [
    //                     Text(
    //                       '23',
    //                       style: GoogleFonts.poppins(
    //                         fontSize: 46,
    //                         color: Colors.white,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                     Container(
    //                       width: 15,
    //                       height: 15,
    //                       decoration: BoxDecoration(
    //                         border: Border.all(color: Colors.white, width: 3),
    //                         shape: BoxShape.circle,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Expanded(
    //             child: Image.asset(
    //               image,
    //               //     width: 210,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
